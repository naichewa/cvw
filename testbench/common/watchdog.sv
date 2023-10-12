///////////////////////////////////////////
// watchdog.sv
//
// Written: Ross Thompson ross1728@gmail.com
// Modified: 14 June 2023
//
// Purpose: Detects if the processor is stuck and halts the simulation
// 
// A component of the Wally configurable RISC-V project.
// 
// Copyright (C) 2021 Harvey Mudd College & Oklahoma State University
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

module watchdog #(parameter XLEN, WatchDogTimerThreshold) 
  (input clk,
   input reset
   );
  
  // check for hang up.
  logic [XLEN-1:0]    PCW;
  flopenr #(XLEN) PCWReg(clk, reset, ~dut.core.ieu.dp.StallW, dut.core.ifu.PCM, PCW);
  logic [XLEN-1:0]    OldPCW;
  integer               WatchDogTimerCount;
  logic                 WatchDogTimeOut;
  always_ff @(posedge clk) begin
    OldPCW <= PCW;
    if(OldPCW == PCW) WatchDogTimerCount = WatchDogTimerCount + 1'b1;
    else WatchDogTimerCount = '0;
  end

  always_comb begin
    WatchDogTimeOut = WatchDogTimerCount >= WatchDogTimerThreshold;
    if(WatchDogTimeOut) begin
      $display("FAILURE: Watch Dog Time Out triggered. PCW stuck at %x for more than %d cycles", PCW, WatchDogTimerCount);
      $stop;
	end
  end

endmodule
