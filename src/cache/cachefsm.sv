///////////////////////////////////////////
// cachefsm.sv
//
// Written: Ross Thompson ross1728@gmail.com
// Created: 25 August 2021
// Modified: 20 January 2023
//
// Purpose: Controller for the cache fsm
//
// Documentation: RISC-V System on Chip Design Chapter 7 (Figure 7.14 and Table 7.1)
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

module cachefsm import cvw::*; #(parameter cvw_t P,
                                 parameter READ_ONLY_CACHE = 0) (
  input  logic       clk,
  input  logic       reset,
  // hazard and privilege unit
  input  logic       Stall,             // Stall the cache, preventing new accesses. In-flight access finished but does not return to READY
  input  logic       FlushStage,        // Pipeline flush of second stage (prevent writes and bus operations)
  output logic       CacheCommitted,    // Cache has started bus operation that shouldn't be interrupted
  output logic       CacheStall,        // Cache stalls pipeline during multicycle operation
  // inputs from IEU
  input  logic [1:0] CacheRW,           // [1] Read, [0] Write 
  input  logic [1:0] CacheAtomic,       // Atomic operation
  input  logic       FlushCache,        // Flush all dirty lines back to memory
  input  logic       InvalidateCache,   // Clear all valid bits
  input  logic [3:0] CMOp,              // 1: cbo.inval; 2: cbo.flush; 4: cbo.clean; 8: cbo.zero
  // Bus controls
  input  logic       CacheBusAck,       // Bus operation completed
  output logic [1:0] CacheBusRW,        // [1] Read (cache line fetch) or [0] write bus (cache line writeback)
  // performance counter outputs
  output logic       CacheMiss,         // Cache miss  
  output logic       CacheAccess,       // Cache access

  // cache internals
  input  logic       CacheHit,          // Exactly 1 way hits
  input  logic       LineDirty,         // The selected line and way is dirty
  input  logic       FlushAdrFlag,      // On last set of a cache flush
  input  logic       FlushWayFlag,      // On the last way for any set of a cache flush
  output logic       SelAdr,            // [0] SRAM reads from NextAdr, [1] SRAM reads from PAdr
  output logic       SetValid,          // Set the valid bit in the selected way and set
  output logic       ClearValid,        // Clear the valid bit in the selected way and set
  output logic       SetDirty,          // Set the dirty bit in the selected way and set
  output logic       ClearDirty,        // Clear the dirty bit in the selected way and set
  output logic       ZeroCacheLine,     // Write zeros to all bytes of cacheline
  output logic       CMOZeroHit,        // CMOZ hit
  output logic       SelWriteback,      // Overrides cached tag check to select a specific way and set for writeback
  output logic       SelCMOWriteback,   // Overrides cached tag check to select a specific way and set for writeback for both data and tag
  output logic       LRUWriteEn,        // Update the LRU state
  output logic       SelFlush,          // [0] Use SelAdr, [1] SRAM reads/writes from FlushAdr
  output logic       FlushAdrCntEn,     // Enable the counter for Flush Adr
  output logic       FlushWayCntEn,     // Enable the way counter during a flush
  output logic       FlushCntRst,       // Reset both flush counters
  output logic       SelFetchBuffer,    // Bypass the SRAM for a load hit by directly using the read data from the ahbcacheinterface's FetchBuffer
  output logic       CacheEn            // Enable the cache memory arrays.  Disable hold read data constant
);
  
  logic              resetDelay;
  logic              AnyUpdateHit, AnyHit;
  logic              AnyMiss;
  logic              FlushFlag;
  logic              CMOWritebackHit;
  logic              CMOZeroNoEviction;
  logic              CMOZeroEviction;

  typedef enum logic [3:0]{STATE_READY, // hit states
                           // miss states
                           STATE_FETCH,
                           STATE_WRITEBACK,
                           STATE_WRITE_LINE,
                           STATE_READ_HOLD,  // required for back to back reads. structural hazard on writting SRAM
                           // flush cache 
                           STATE_FLUSH,
                           STATE_FLUSH_WRITEBACK,
                           // CMO states
                           STATE_CMO_WRITEBACK,
                           STATE_CMO_DONE
                           } statetype;

  statetype CurrState, NextState;

  assign AnyMiss = (CacheRW[0] | CacheRW[1]) & ~CacheHit & ~InvalidateCache; // exclusion-tag: cache AnyMiss
  assign AnyUpdateHit = (CacheRW[0]) & CacheHit;                            // exclusion-tag: icache storeAMO1
  assign AnyHit = AnyUpdateHit | (CacheRW[1] & CacheHit);                  // exclusion-tag: icache AnyUpdateHit
  assign CMOWritebackHit = (CMOp[1] | CMOp[2]) & CacheHit;
  assign CMOZeroNoEviction = CMOp[3] & ~LineDirty;   // (hit or miss) with no writeback store zeros now
  assign CMOZeroEviction = CMOp[3] & LineDirty;   // (hit or miss) with writeback dirty line
  
  assign FlushFlag = FlushAdrFlag & FlushWayFlag;

  // outputs for the performance counters.
  assign CacheAccess = (|CacheRW) & ((CurrState == STATE_READY & ~Stall & ~FlushStage) | (CurrState == STATE_READ_HOLD & ~Stall & ~FlushStage)); // exclusion-tag: icache CacheW
  assign CacheMiss = CacheAccess & ~CacheHit;

  // special case on reset. When the fsm first exists reset the
  // PCNextF will no longer be pointing to the correct address.
  // But PCF will be the reset vector.
  flop #(1) resetDelayReg(.clk, .d(reset), .q(resetDelay));

  always_ff @(posedge clk)
    if (reset | FlushStage)    CurrState <= #1 STATE_READY;
    else CurrState <= #1 NextState;  
  
  always_comb begin
    NextState = STATE_READY;
    case (CurrState)                                                                                        // exclusion-tag: icache state-case
      STATE_READY:           if(InvalidateCache)                               NextState = STATE_READY;     // exclusion-tag: dcache InvalidateCheck
                             else if(FlushCache & ~READ_ONLY_CACHE)            NextState = STATE_FLUSH;
                             else if(AnyMiss & (READ_ONLY_CACHE | ~LineDirty)) NextState = STATE_FETCH;     // exclusion-tag: icache FETCHStatement
                             else if(AnyMiss | CMOZeroEviction)                NextState = STATE_WRITEBACK; // exclusion-tag: icache WRITEBACKStatement
                             else if(CMOWritebackHit)                          NextState = STATE_CMO_WRITEBACK; 
                             else                                              NextState = STATE_READY;
      STATE_FETCH:           if(CacheBusAck)                                   NextState = STATE_WRITE_LINE;
                             else if(CacheBusAck)                              NextState = STATE_READY;
                             else                                              NextState = STATE_FETCH;
      STATE_WRITE_LINE:                                                        NextState = STATE_READ_HOLD;
      STATE_READ_HOLD:       if(Stall)                                         NextState = STATE_READ_HOLD;
                             else                                              NextState = STATE_READY;
      // exclusion-tag-start: icache case
      STATE_WRITEBACK:       if(CacheBusAck & ~CMOp[3])                        NextState = STATE_FETCH;
                             else if(CacheBusAck)                              NextState = STATE_CMO_DONE;
                             else                                              NextState = STATE_WRITEBACK;
      // eviction needs a delay as the bus fsm does not correctly handle sending the write command at the same time as getting back the bus ack.
      STATE_FLUSH:           if(LineDirty)                                     NextState = STATE_FLUSH_WRITEBACK;
                             else if (FlushFlag)                               NextState = STATE_READ_HOLD;
                             else                                              NextState = STATE_FLUSH;
      STATE_FLUSH_WRITEBACK: if(CacheBusAck & ~FlushFlag)                      NextState = STATE_FLUSH;
                             else if(CacheBusAck)                              NextState = STATE_READ_HOLD;
                             else                                              NextState = STATE_FLUSH_WRITEBACK;

      STATE_CMO_WRITEBACK:   if(CacheBusAck & (CMOp[1] | CMOp[2]))             NextState = STATE_CMO_DONE;
                             else                                              NextState = STATE_CMO_WRITEBACK;
      STATE_CMO_DONE:        if(Stall)                                         NextState = STATE_CMO_DONE;
                             else                                              NextState = STATE_READY;
      // exclusion-tag-end: icache case
      default:                                                                 NextState = STATE_READY;
    endcase
  end

  // com back to CPU
  assign CacheCommitted = (CurrState != STATE_READY) & ~(READ_ONLY_CACHE & (CurrState == STATE_READ_HOLD | CurrState == STATE_CMO_DONE));
  assign CacheStall = (CurrState == STATE_READY & (FlushCache | AnyMiss | CMOWritebackHit | CMOZeroEviction)) | // exclusion-tag: icache StallStates
                      (CurrState == STATE_FETCH) |
                      (CurrState == STATE_WRITEBACK) |
                      (CurrState == STATE_WRITE_LINE) |  // this cycle writes the sram, must keep stalling so the next cycle can read the next hit/miss unless its a write.
                      (CurrState == STATE_FLUSH) |
                      (CurrState == STATE_FLUSH_WRITEBACK) |
                      (CurrState == STATE_CMO_WRITEBACK);
  // write enables internal to cache
  assign CMOZeroHit = CurrState == STATE_READY & CMOp[3] & CacheHit ;
  assign SetValid = CurrState == STATE_WRITE_LINE | 
                    (CurrState == STATE_READY & CMOZeroNoEviction) |
                    (P.ZICBOZ_SUPPORTED & CurrState == STATE_WRITEBACK & CacheBusAck & CMOp[3]); 
  assign ClearValid = P.ZICBOM_SUPPORTED & ((CurrState == STATE_READY & CMOp[0] & CacheHit) |
                      (CurrState == STATE_CMO_WRITEBACK & CMOp[2] & CacheBusAck));
  // coverage off -item e 1 -fecexprrow 8
  assign LRUWriteEn = (((CurrState == STATE_READY & (AnyHit | CMOZeroNoEviction)) |
                       (CurrState == STATE_WRITE_LINE)) & ~FlushStage) |
                      (P.ZICBOZ_SUPPORTED & CurrState == STATE_WRITEBACK & CMOp[3] & CacheBusAck);
  // exclusion-tag-start: icache flushdirtycontrols
  assign SetDirty = (CurrState == STATE_READY & (AnyUpdateHit | CMOZeroNoEviction)) |         // exclusion-tag: icache SetDirty  
                    (CurrState == STATE_WRITE_LINE & (CacheRW[0])) |
                    (P.ZICBOZ_SUPPORTED & CurrState == STATE_WRITEBACK & (CMOp[3] & CacheBusAck));                    
  assign ClearDirty = (CurrState == STATE_WRITE_LINE & ~(CacheRW[0])) |   // exclusion-tag: icache ClearDirty
                      (CurrState == STATE_FLUSH & LineDirty) | // This is wrong in a multicore snoop cache protocal.  Dirty must be cleared concurrently and atomically with writeback.  For single core cannot clear after writeback on bus ack and change flushadr.  Clears the wrong set.
  // Flush and eviction controls
                      (P.ZICBOM_SUPPORTED & CurrState == STATE_CMO_WRITEBACK & (CMOp[1] | CMOp[2]) & CacheBusAck);
  assign ZeroCacheLine = P.ZICBOZ_SUPPORTED & ((CurrState == STATE_READY & CMOZeroNoEviction) | 
                                               (CurrState == STATE_WRITEBACK & (CMOp[3] & CacheBusAck)));  
  assign SelWriteback = (CurrState == STATE_WRITEBACK & ~CacheBusAck) |
                    (CurrState == STATE_READY & AnyMiss & LineDirty);
  assign SelCMOWriteback = CurrState == STATE_CMO_WRITEBACK;

  assign SelFlush = (CurrState == STATE_READY & FlushCache) |
          (CurrState == STATE_FLUSH) | 
          (CurrState == STATE_FLUSH_WRITEBACK);
  // coverage off -item e 1 -fecexprrow 1
  // (state is always FLUSH_WRITEBACK when FlushWayFlag & CacheBusAck)
  assign FlushAdrCntEn = (CurrState == STATE_FLUSH_WRITEBACK & FlushWayFlag & CacheBusAck) |
             (CurrState == STATE_FLUSH & FlushWayFlag & ~LineDirty);
  assign FlushWayCntEn = (CurrState == STATE_FLUSH & ~LineDirty) |
             (CurrState == STATE_FLUSH_WRITEBACK & CacheBusAck);
  assign FlushCntRst = (CurrState == STATE_FLUSH & FlushFlag & ~LineDirty) |
              (CurrState == STATE_FLUSH_WRITEBACK & FlushFlag & CacheBusAck);
  // exclusion-tag-end: icache flushdirtycontrols
  // Bus interface controls
  assign CacheBusRW[1] = (CurrState == STATE_READY & AnyMiss & ~LineDirty) | // exclusion-tag: icache CacheBusRCauses
                         (CurrState == STATE_FETCH & ~CacheBusAck) | 
                         (CurrState == STATE_WRITEBACK & CacheBusAck & ~CMOp[3]);
  assign CacheBusRW[0] = (CurrState == STATE_READY & AnyMiss & LineDirty) | // exclusion-tag: icache CacheBusW
                         (CurrState == STATE_WRITEBACK & ~CacheBusAck) |
                         (CurrState == STATE_FLUSH_WRITEBACK & ~CacheBusAck) |
                         (P.ZICBOM_SUPPORTED & CurrState == STATE_CMO_WRITEBACK & (CMOp[1] | CMOp[2]) & ~CacheBusAck);

  assign SelAdr = (CurrState == STATE_READY & (CacheRW[0] | AnyMiss | (|CMOp))) | // exclusion-tag: icache SelAdrCauses // changes if store delay hazard removed
                  (CurrState == STATE_FETCH) |
                  (CurrState == STATE_WRITEBACK) |
                  (CurrState == STATE_WRITE_LINE) |
                  (CurrState == STATE_CMO_WRITEBACK) |
                  resetDelay;
  assign SelFetchBuffer = CurrState == STATE_WRITE_LINE | CurrState == STATE_READ_HOLD;
  assign CacheEn = (~Stall | FlushCache | AnyMiss) | (CurrState != STATE_READY) | reset | InvalidateCache; // exclusion-tag: dcache CacheEn
                       
endmodule // cachefsm
