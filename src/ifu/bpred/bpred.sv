///////////////////////////////////////////
// bpred.sv
//
// Written: Ross Thomposn ross1728@gmail.com
// Created: 12 February 2021
// Modified: 19 January 2023
//
// Purpose: Branch direction prediction and jump/branch target prediction.
//          Prediction made during the fetch stage and corrected in the execution stage.
// 
// A component of the CORE-V-WALLY configurable RISC-V project.
// 
// Copyright (C) 2021-23 Harvey Mudd College & Oklahoma State University
//
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
//
// Licensed under the Solderpad Hardware License v 2.1 (the “License”); you may not use this file 
// except in compliance with the License, or, at your option, the Apache License version 2.0. You 
// may obtain a copy of the License at
//
// https://solderpad.org/licenses/SHL-2.1/
//
// Unless required by applicable law or agreed to in writing, any work distributed under the 
// License is distributed on an “AS IS” BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, 
// either express or implied. See the License for the specific language governing permissions 
// and limitations under the License.
////////////////////////////////////////////////////////////////////////////////////////////////

`include "wally-config.vh"

`define INSTR_CLASS_PRED 1

module bpred (
  input  logic             clk, reset,
  input  logic             StallF, StallD, StallE, StallM, StallW,
  input  logic             FlushD, FlushE, FlushM, FlushW,
  // Fetch stage
  // the prediction
  input  logic [31:0]      InstrD,                    // Decompressed decode stage instruction. Used to decode instruction class
  input  logic [`XLEN-1:0] PCNextF,                   // Next Fetch Address
  input  logic [`XLEN-1:0] PCPlus2or4F,               // PCF+2/4
  output logic [`XLEN-1:0] PCNext1F,                  // Branch Predictor predicted or corrected fetch address on miss prediction
  output logic [`XLEN-1:0] NextValidPCE,              // Address of next valid instruction after the instruction in the Memory stage

  // Update Predictor
  input  logic [`XLEN-1:0] PCF,                       // Fetch stage instruction address
  input  logic [`XLEN-1:0] PCD,                       // Decode stage instruction address. Also the address the branch predictor took
  input  logic [`XLEN-1:0] PCE,                       // Execution stage instruction address
  input  logic [`XLEN-1:0] PCM,                       // Memory stage instruction address

  input logic [31:0]       PostSpillInstrRawF,        // Instruction

  // Branch and jump outcome
  input logic              InstrValidD, InstrValidE,
  input  logic             BranchD, BranchE,
  input  logic             JumpD, JumpE,
  input logic              PCSrcE,                    // Executation stage branch is taken
  input logic [`XLEN-1:0]  IEUAdrE,                   // The branch/jump target address
  input logic [`XLEN-1:0]  PCLinkE,                   // The address following the branch instruction. (AKA Fall through address)
  output logic [3:0]       InstrClassM,               // The valid instruction class. 1-hot encoded as jalr, ret, jr (not ret), j, br
  output logic             JumpOrTakenBranchM,        // The valid instruction class. 1-hot encoded as jalr, ret, jr (not ret), j, br

  // Report branch prediction status
  output logic             BPPredWrongE,              // Prediction is wrong
  output logic             BPPredWrongM,              // Prediction is wrong
  output logic             DirPredictionWrongM,       // Prediction direction is wrong
  output logic             BTBPredPCWrongM,           // Prediction target wrong
  output logic             RASPredPCWrongM,           // RAS prediction is wrong
  output logic             PredictionInstrClassWrongM // Class prediction is wrong
  );

  logic                     PredValidF;
  logic [1:0]               DirPredictionF;

  logic [3:0]               BTBPredInstrClassF, PredInstrClassF, PredInstrClassD;
  logic [`XLEN-1:0]         PredPCF, RASPCF;
  logic                     PredictionPCWrongE;
  logic                     AnyWrongPredInstrClassD, AnyWrongPredInstrClassE;
  logic [3:0]               InstrClassD;
  logic [3:0] 				InstrClassE;
  logic                     DirPredictionWrongE, BTBPredPCWrongE, RASPredPCWrongE;
  
  logic                     SelBPPredF;
  logic [`XLEN-1:0]         BPPredPCF;
  logic [`XLEN-1:0]         PCNext0F;
  logic [`XLEN-1:0] 		PCCorrectE;
  logic [3:0] 				WrongPredInstrClassD;

  logic 					BTBTargetWrongE;
  logic 					RASTargetWrongE;
  logic 					JumpOrTakenBranchE;

  logic [`XLEN-1:0] PredPCD, PredPCE, RASPCD, RASPCE;

  // Part 1 branch direction prediction
  // look into the 2 port Sram model. something is wrong. 
  if (`BPRED_TYPE == "BPTWOBIT") begin:Predictor
    twoBitPredictor #(`BPRED_SIZE) DirPredictor(.clk, .reset, .StallF, .StallD, .StallE, .StallM, .FlushD, .FlushE, .FlushM,
      .PCNextF, .PCM, .DirPredictionF, .DirPredictionWrongE,
      .BranchInstrE(InstrClassE[0]), .BranchInstrM(InstrClassM[0]), .PCSrcE);

  end else if (`BPRED_TYPE == "BPGLOBAL") begin:Predictor
    globalhistory #(`BPRED_SIZE) DirPredictor(.clk, .reset, .StallF, .StallD, .StallE, .StallM, .FlushD, .FlushE, .FlushM,
      .PCNextF, .PCM, .DirPredictionF, .DirPredictionWrongE,
      .BranchInstrE(InstrClassE[0]), .BranchInstrM(InstrClassM[0]), .PCSrcE);

  end else if (`BPRED_TYPE == "BPSPECULATIVEGLOBAL") begin:Predictor
    speculativeglobalhistory #(`BPRED_SIZE) DirPredictor(.clk, .reset, .StallF, .StallD, .StallE, .StallM, .StallW, .FlushD, .FlushE, .FlushM, .FlushW,
      .DirPredictionF, .DirPredictionWrongE,
      .PredInstrClassF, .InstrClassD, .InstrClassE, .InstrClassM, .WrongPredInstrClassD, .PCSrcE);
	    
  end else if (`BPRED_TYPE == "BPGSHARE") begin:Predictor
    gshare #(`BPRED_SIZE) DirPredictor(.clk, .reset, .StallF, .StallD, .StallE, .StallM, .StallW, .FlushD, .FlushE, .FlushM, .FlushW,
      .PCNextF, .PCM, .DirPredictionF, .DirPredictionWrongE,
      .BranchInstrE(InstrClassE[0]), .BranchInstrM(InstrClassM[0]), .PCSrcE);

  end else if (`BPRED_TYPE == "BPSPECULATIVEGSHARE") begin:Predictor
    speculativegshare #(`BPRED_SIZE) DirPredictor(.clk, .reset, .StallF, .StallD, .StallE, .StallM, .StallW, .FlushD, .FlushE, .FlushM, .FlushW,
      .PCNextF, .PCF, .PCD, .PCE, .DirPredictionF, .DirPredictionWrongE,
      .PredInstrClassF, .InstrClassD, .InstrClassE, .InstrClassM, .WrongPredInstrClassD, .PCSrcE);

  end else if (`BPRED_TYPE == "BPLOCALPAg") begin:Predictor
    // *** Fix me
/* -----\/----- EXCLUDED -----\/-----
    localHistoryPredictor DirPredictor(.clk,
      .reset, .StallF, .StallE,
      .LookUpPC(PCNextF),
      .Prediction(DirPredictionF),
      // update
      .UpdatePC(PCE),
      .UpdateEN(InstrClassE[0] & ~StallE),
      .PCSrcE,
      .UpdatePrediction(InstrClassE[0]));
 -----/\----- EXCLUDED -----/\----- */
  end 

  // Part 2 Branch target address prediction
  // BTB contains target address for all CFI

  btb #(`BTB_SIZE) 
    TargetPredictor(.clk, .reset, .StallF, .StallD, .StallM, .FlushD, .FlushM,
          .PCNextF, .PCF, .PCD, .PCE,
          .PredPCF,
          .BTBPredInstrClassF,
          .PredValidF,
          .AnyWrongPredInstrClassE,
          .IEUAdrE,
          .InstrClassD,
          .InstrClassE);

  // the branch predictor needs a compact decoding of the instruction class.
  if (`INSTR_CLASS_PRED == 0) begin : DirectClassDecode
	logic [4:0] CompressedOpcF;
	logic [3:0] InstrClassF;
	logic 		cjal, cj, cjr, cjalr, CJumpF, CBranchF;
	logic 		JumpF, BranchF;
	
	assign CompressedOpcF = {PostSpillInstrRawF[1:0], PostSpillInstrRawF[15:13]};

	assign cjal = CompressedOpcF == 5'h09 & `XLEN == 32;
	assign cj = CompressedOpcF == 5'h0d;
	assign cjr = CompressedOpcF == 5'h14 & ~PostSpillInstrRawF[12] & PostSpillInstrRawF[6:2] == 5'b0 & PostSpillInstrRawF[11:7] != 5'b0;
	assign cjalr = CompressedOpcF == 5'h14 & PostSpillInstrRawF[12] & PostSpillInstrRawF[6:2] == 5'b0 & PostSpillInstrRawF[11:7] != 5'b0;
	assign CJumpF = cjal | cj | cjr | cjalr;
	assign CBranchF = CompressedOpcF[4:1] == 4'h7;

	assign JumpF = PostSpillInstrRawF[6:0] == 7'h67 | PostSpillInstrRawF[6:0] == 7'h6F;
	assign BranchF = PostSpillInstrRawF[6:0] == 7'h63;
	
	assign InstrClassF[0] = BranchF | (`C_SUPPORTED & CBranchF);
	assign InstrClassF[1] = JumpF | (`C_SUPPORTED & (cjal | cj | cj | cjalr));
	assign InstrClassF[2] = (JumpF & (PostSpillInstrRawF[19:15] & 5'h1B) == 5'h01) | // return must return to ra or r5
							(`C_SUPPORTED & (cjalr | cjr) & ((PostSpillInstrRawF[11:7] & 5'h1B) == 5'h01));
	
	assign InstrClassF[3] = (JumpF & (PostSpillInstrRawF[11:07] & 5'h1B) == 5'h01) | // jal(r) must link to ra or x5
							(`C_SUPPORTED & (cjal | (cjalr & (PostSpillInstrRawF[11:7] & 5'h1b) == 5'h01)));

	assign PredInstrClassF = InstrClassF;
	assign SelBPPredF = (PredInstrClassF[0] & DirPredictionF[1]) | 
						PredInstrClassF[1];
  end else begin
	assign PredInstrClassF = BTBPredInstrClassF;
	assign SelBPPredF = (PredInstrClassF[0] & DirPredictionF[1] & PredValidF) | 
						PredInstrClassF[1] & PredValidF;
  end
  
  // Part 3 RAS
  RASPredictor RASPredictor(.clk, .reset, .StallF, .StallD, .StallE, .StallM, .FlushD, .FlushE, .FlushM,
							.PredInstrClassF, .InstrClassD, .InstrClassE,
							.WrongPredInstrClassD, .RASPCF, .PCLinkE);

  assign BPPredPCF = PredInstrClassF[2] ? RASPCF : PredPCF;

  assign InstrClassD[0] = BranchD;
  assign InstrClassD[1] = JumpD ;
  assign InstrClassD[2] = JumpD & (InstrD[19:15] & 5'h1B) == 5'h01; // return must return to ra or x5
  assign InstrClassD[3] = JumpD & (InstrD[11:7] & 5'h1B) == 5'h01; // jal(r) must link to ra or x5

  flopenrc #(4) InstrClassRegE(clk, reset,  FlushE, ~StallE, InstrClassD, InstrClassE);
  flopenrc #(4) InstrClassRegM(clk, reset,  FlushM, ~StallM, InstrClassE, InstrClassM);
  flopenrc #(1) BPPredWrongMReg(clk, reset, FlushM, ~StallM, BPPredWrongE, BPPredWrongM);

  // branch predictor
  flopenrc #(4) BPPredWrongRegM(clk, reset, FlushM, ~StallM, 
    {DirPredictionWrongE, BTBPredPCWrongE, RASPredPCWrongE, AnyWrongPredInstrClassE},
    {DirPredictionWrongM, BTBPredPCWrongM, RASPredPCWrongM, PredictionInstrClassWrongM});

  // pipeline the class
  flopenrc #(4) PredInstrClassRegD(clk, reset, FlushD, ~StallD, PredInstrClassF, PredInstrClassD);
  flopenrc #(1) WrongInstrClassRegE(clk, reset, FlushE, ~StallE, AnyWrongPredInstrClassD, AnyWrongPredInstrClassE);
 
  // Check the prediction
  // if it is a CFI then check if the next instruction address (PCD) matches the branch's target or fallthrough address.
  // if the class prediction is wrong a regular instruction may have been predicted as a taken branch
  // this will result in PCD not being equal to the fall through address PCLinkE (PCE+4).
  // The next instruction is always valid as no other flush would occur at the same time as the branch and not
  // also flush the branch.  This will change in a superscaler cpu. 
  assign PredictionPCWrongE = PCCorrectE != PCD;

  // branch class prediction wrong.
  assign WrongPredInstrClassD = PredInstrClassD ^ InstrClassD[3:0];
  assign AnyWrongPredInstrClassD = |WrongPredInstrClassD;
  
  // branch is wrong only if the PC does not match and both the Decode and Fetch stages have valid instructions.
  assign BPPredWrongE = (PredictionPCWrongE & |InstrClassE | (AnyWrongPredInstrClassE & ~|InstrClassE));
  //assign BPPredWrongE = PredictionPCWrongE & InstrValidE & InstrValidD; // this does not work for cubic benchmark

  // Output the predicted PC or corrected PC on miss-predict.
  // Selects the BP or PC+2/4.
  mux2 #(`XLEN) pcmux0(PCPlus2or4F, BPPredPCF, SelBPPredF, PCNext0F);
  // If the prediction is wrong select the correct address.
  mux2 #(`XLEN) pcmux1(PCNext0F, PCCorrectE, BPPredWrongE, PCNext1F);  
  // Correct branch/jump target.
  mux2 #(`XLEN) pccorrectemux(PCLinkE, IEUAdrE, PCSrcE, PCCorrectE);
  
  // If the fence/csrw was predicted as a taken branch then we select PCF, rather PCE.
  // Effectively this is PCM+4 or the non-existant PCLinkM
  if(`INSTR_CLASS_PRED) mux2 #(`XLEN) pcmuxBPWrongInvalidateFlush(PCE, PCF, BPPredWrongM, NextValidPCE);
  else	assign NextValidPCE = PCE;

  // performance counters
  // 1. class         (class wrong / minstret) (PredictionInstrClassWrongM / csr)                    // Correct now
  // 2. target btb    (btb target wrong / class[0,1,3])  (btb target wrong / (br + j + jal)
  // 3. target ras    (ras target wrong / class[2])
  // 4. direction     (br dir wrong / class[0])

  // Unforuantely we can't relay on PCD to infer the correctness of the BTB or RAS because the class prediction 
  // could be wrong or the fall through address selected for branch predict not taken.
  // By pipeline the BTB's PC and RAS address through the pipeline we can measure the accuracy of
  // both without the above inaccuracies.
  assign BTBPredPCWrongE = (PredPCE != IEUAdrE) & (InstrClassE[0] | InstrClassE[1] & ~InstrClassE[2]) & PCSrcE;
  assign RASPredPCWrongE = (RASPCE != IEUAdrE) & InstrClassE[2] & PCSrcE;

  assign JumpOrTakenBranchE = (InstrClassE[0] & PCSrcE) | InstrClassE[1];
  
  flopenrc #(1) JumpOrTakenBranchMReg(clk, reset, FlushM, ~StallM, JumpOrTakenBranchE, JumpOrTakenBranchM);

  flopenrc #(`XLEN) BTBTargetDReg(clk, reset, FlushD, ~StallD, PredPCF, PredPCD);
  flopenrc #(`XLEN) BTBTargetEReg(clk, reset, FlushE, ~StallE, PredPCD, PredPCE);

  flopenrc #(`XLEN) RASTargetDReg(clk, reset, FlushD, ~StallD, RASPCF, RASPCD);
  flopenrc #(`XLEN) RASTargetEReg(clk, reset, FlushE, ~StallE, RASPCD, RASPCE);
  
endmodule