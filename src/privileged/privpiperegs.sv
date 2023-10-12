///////////////////////////////////////////
// privpiperegs.sv
//
// Written: David_Harris@hmc.edu 12 May 2022
// Modified: 
//
// Purpose: Pipeline registers for early exceptions
// 
// Documentation: RISC-V System on Chip Design Chapter 5
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

module privpiperegs (
  input  logic         clk, reset,  
  input  logic         StallD, StallE, StallM,
  input  logic         FlushD, FlushE, FlushM,
  input  logic         InstrPageFaultF, InstrAccessFaultF,  // instruction faults
  input  logic         HPTWInstrAccessFaultF,               // hptw fault during instruction page fetch
  input  logic         IllegalIEUFPUInstrD,                 // illegal IEU instruction decoded
  output logic         InstrPageFaultM, InstrAccessFaultM,  // delayed instruction faults
  output logic         IllegalIEUFPUInstrM,                 // delayed illegal IEU instruction
  output logic         HPTWInstrAccessFaultM                // hptw fault during instruction page fetch
);

  // Delayed fault signals
  logic                InstrPageFaultD, InstrAccessFaultD, HPTWInstrAccessFaultD;
  logic                InstrPageFaultE, InstrAccessFaultE, HPTWInstrAccessFaultE;
  logic                IllegalIEUFPUInstrE; 

  // pipeline fault signals
  flopenrc #(3) faultregD(clk, reset, FlushD, ~StallD,
                  {InstrPageFaultF, InstrAccessFaultF, HPTWInstrAccessFaultF},
                  {InstrPageFaultD, InstrAccessFaultD, HPTWInstrAccessFaultD});
  flopenrc #(4) faultregE(clk, reset, FlushE, ~StallE,
                  {IllegalIEUFPUInstrD, InstrPageFaultD, InstrAccessFaultD, HPTWInstrAccessFaultD}, 
                  {IllegalIEUFPUInstrE, InstrPageFaultE, InstrAccessFaultE, HPTWInstrAccessFaultE});
  flopenrc #(4) faultregM(clk, reset, FlushM, ~StallM,
                  {IllegalIEUFPUInstrE, InstrPageFaultE, InstrAccessFaultE, HPTWInstrAccessFaultE},
                  {IllegalIEUFPUInstrM, InstrPageFaultM, InstrAccessFaultM, HPTWInstrAccessFaultM});
endmodule
