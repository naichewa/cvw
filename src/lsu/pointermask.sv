///////////////////////////////////////////
// pointermask.sv
//
// Written: naichewa@gmail.com 8/6/2026
// Modified:
//
// Purpose: Pointer Masking Module v1.0
// Module inside of LSU that currently determines whether pointer masking should be applied based on privilege level and instruction.
// Pointer Masking length (PMLength) currently limited so that masked bits do not apply to address bits.
// (PMLen = 7 when Sv57 is supported, 16 or 7 when Sv57 not supported. In addition, physical addresses are
// limited to 48 bits when PMLength = 16) Hypervisor guest physical addresses are 2 bits longer and therefore have
// additional configurations where addressable bits are masked, for future work.
// Since addressable bits are never masked in current version, the module itself only sends a signal to disable top bit
// validity checks to vm64check.sv
// Documentation: Based on ddescriptions in RISC-V Privileged Specifications
// Chapter on Pointer Masking https://docs.riscv.org/reference/isa/v20260120/priv/zpm.html
// Complete Specifications V20260120 https://docs.riscv.org/reference/isa/_attachments/riscv-privileged.pdf
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

// current todos: implement mssec register in csrm, add to csr.sv
module pointermask import cvw::*;   #(parameter cvw_t P) (
    input logic [P.SVMODE_BITS-1.0]  SATP_MODE,
    input logic [2:0]                MSECCFG_PMM, MENVCFG_PMM, SENVCFG_PMM,
    input logic [1:0]                PrivilegeModeW,
    input logic [1:0]                STATUS_MPP,
    input logic                      STATUS_SPP, STATUS_MXR, STATUS_MPRV,
    output logic                     MaskApplied
);

  logic MaskApplicableInstr;
  logic MaskPrivilegeMode;
  //Determine if instruction is mask-applicable (explicit memory access)


  //Determine if mask should be applied based on CSR configuration PMM bits and current privilege level
  always_comb
    case(PrivilegeModeW)
      00:           MaskPrivilegeMode = 2'b00;
      01:           MaskPrivilegeMode = MPRV ? {1'b0,STATUS_SPP} : 2'b01;
      11:           MaskPrivilegeMode= MPRV ? STATUS_MPP : 2'b11;
      default:      MaskPrivilegeMode = PrivilegeModeW;
    endcase
  always_comb
    case(MaskPrivilegeMode)
      00:           MaskApplied = MaskApplicableInstr & ((MENVCFG_PMM & !S_SUPPORTED) | SENVCFG_PMM);
      01:           MaskApplied = MaskApplicableInstr & (MENVCFG_PMM & P.S_SUPPORTED);
      11:           MaskApplied = MaskApplicableInstr & (MSECCFG_PMM | MENVCFG_PMM);
      default:      MaskApplied = 1'b0;
    endcase
