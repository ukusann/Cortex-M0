`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2023 04:10:04 PM
// Design Name: 
// Module Name: Datapath
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`define NO_INST   5'h1f


module Datapath(
    input wire clk,
    input wire rst,
    
    input wire wr_en,
    input wire branch,
    input wire cu_execute,
    input wire led_en,
    
    // Control Signals
    input wire ld_sp,
    input wire ld_lr,
    input wire ld_pc,
    input wire ld_ir,   
    
    // Register Signal
    input wire ld_rd,
    input wire ld_rn,
    
    // Program Status Registers Signals
    input wire ld_apsr,
    input wire ld_ipsr,
    
    // Priority Mask Register Signal
    input wire ld_primask,
    
    // Memory 
    input wire [31:0]dout_flash,
    input wire [31:0] dout_mem, // Output data Memory (Read/Load) 
    
    output wire [31:0] din_mem,  // Input data Memory (Write/Store)
    
    // Memory adrresses:
    output wire [9:0] flash_addr_PC,
    output wire [31:0] addr_mem, 
    
    // Control Signals
    output wire update_flags, // S == 1
    output wire write_rd,     // needs to write in Rd
    output wire write_rn,     // needs to wirte in Rn
    output wire mem_en,       // Enable Memory
    output wire mem_wr,       // Memory Write/Read Mode 
    output wire ig_ex,        // Ignore execute state 
    output wire br_en,        // a branch needs to be executed
    output wire br_L,          // needs to write in LR (Link Register)
    
    output wire [3:0] out_leds
    );
  
// ____________________________________________________________________________________________________
// ====================================================================================================
// ====================================================================================================
// ====================================================================================================
                                /* Memory and Core Registers*/

    wire [31:0] w_SP;     // Write Stack Pointer 
    wire [31:0] w_LR;     // Write Link Register 
    wire [31:0] w_PC;     // Write Program Counter 
    
     
    wire [31:0] w_Rd;     // Write destanation Reg 
    wire [31:0] w_Rn;     // Write Base offset Reg 
    wire [ 3:0] addr_Rn;  // Rn address
    wire [ 3:0] addr_Rm;  // Rm address
    wire [ 3:0] addr_Rd;  // Rd address
    wire [ 3:0] addr_Rs;  // Rs address

    wire w_n, w_z, w_c, w_v;  // Read Conditional Flags
    wire [ 5:0] w_IPSR;   // Write Exception Numbers
    
    wire w_PMask;         // Write Enable Priority
    
    wire [31:0] SP;       // Stack Pointer 
    wire [31:0] LR;       // Link Register 
    wire [31:0] PC;       // Program Counter 
    wire [31:0] IR;       // Instrution Register
    
    wire [31:0] Rn;       // Rn
    wire [31:0] Rm;       // Rm
    wire [31:0] Rd;       // Destination Register
    wire [ 7:0] Rs;       // Shift Register
    
    wire n, z, c, v;      // Conditional Flags
    wire [ 5:0] IPSR;   // Exception Numbers
    
    wire PMask;           // Enable Priority

                
    // - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - - 
    // - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - - 
                                /* Core Registers */ 
               
    coreRegisters CoreReg(
    // System Signals
            clk, rst,
            
    // Control Signals
            ld_sp,
            ld_lr,
            ld_pc,
            
            branch,
    
    // Register Signal
            ld_rd,
            ld_rn,
            
    // Program Status Registers Signals
            ld_apsr,
            ld_ipsr,
            
    // Priority Mask Register Signal
            ld_primask,
   
    // Core Control Registers:
            w_SP,     // Write Stack Pointer 
            w_LR,     // Write Link Register 
            w_PC,     // Write Program Counter 
    
    // General Purpose Registers
            w_Rd,     // Write destanation Reg 
            w_Rn,     // Write base offset Reg 
            addr_Rn,  // Rn address
            addr_Rm,  // Rm address
            addr_Rd,  // Rd address
            addr_Rs,   // Rs address
    
    // Program Status Registers bits  
            {w_n, w_z, w_c, w_v},   // Write ondicional Flags
            w_IPSR,                 // Write Exception Numbers
    
    // Priority Mask Register
            w_PMask,  // Write Enable Priority
    
    // Core Control Registers:
            SP,       // Read Stack Pointer 
            LR,       // Read Link Register 
            PC,       // Read Program Counter 
    
    // General Purpose Registers
            Rn,      // Read Rn
            Rm,      // Read Rm
            Rd,      // Read destanation Register
            Rs,      // Read Shift Register
            
    // Program Status Registers bits
            {n, z, c, v},  // Read Conditional Flags
            IPSR,          // Read Exception Numbers
    
    // Priority Mask Register
            PMask    // Read Enable Priority
    );
    
    
// ____________________________________________________________________________________________________
// ====================================================================================================
// ====================================================================================================
// ====================================================================================================
                          /* Instruction Register and Instruction Decoder */
    
    wire [4:0] inst;         // Instruction to Execute
    wire    I;         // Immediate Operand or Immediate Offset Enable     
    wire    S;         // Set condition codes
      
    wire [ 1:0]      stype; // Shift Type
    wire [ 4:0]  imm_shift; // Immediate offset Shift
    wire [11:0]   imm_OP_2; // Operand 2 Immediate
  
    wire [23:0] br_offset; // Branch offset  

    
    // Unconditional Instruction Data and Flags:
    wire [ 1:0]  imod; // Interrupt mode
    wire M;            // Change mode signal
    wire A;            // Asynchronous Abort
    wire IRQ;          // IRQ disable
    wire FIQ;          // FIQ disable
    wire [4:0]  mode;  // Processor mode to be ch
    
    wire [4:0] single_trans_f;  // Data Transfer flags ( P, U, B, W, L):
                            //      P: Pre/Post Indexing bit
                            //      U: Up/Down bit
                            //      B: Byte/Word bit
                            //      W: Write-back bit
                            //      L: Load/Store bit
   
 
    // ________________________________________________________________________
                       /* ---- Instruction Register ---- */
 InstReg InstReg(
    rst,
    ld_ir,
    dout_flash,
    
    IR
 );
 
    // ________________________________________________________________________
                    /* ---- Instruction Register Decode ---- */
   
 
 InstDecoder InstDecoder(
   // - - -   - - -   - - -   - - -   - - -   - - -   - - -   - - -   - - -  
                       /* ---- INPUTS ---- */
    
   // System Signals:
    clk,
    rst,
    
    // Instruction Register:
    IR,
    
    // Conditional Flags
    n, z, c, v,
    // - - -   - - -   - - -   - - -   - - -   - - -   - - -   - - -   - - -  
                       /* ---- OUTPUTS ---- */
     inst, // Defines the Instruction to execute 
   
    I,         // Immediate Operand or Immediate Offset     
    update_flags,         // Set condition codes    
    stype,         // Shift Type
   
    // Registers:
    addr_Rn,  // 1st Operand Register or base register   
    addr_Rd,  // Destination Register or source
    addr_Rm,  // Operand 2 Register
    addr_Rs,  // Register offset Shift
    
    // Immediates:
    imm_shift, // Immediate offset Shift
    imm_OP_2,  // Operand 2 Immediate
   
   
    //  Branch:
    br_L,      // Link bit 
    br_offset, // Branch offset  
   
   
    // Unconditional Instruction Data and Flags:
    imod, // Interrupt mode
    M,    // Change mode signal
    A,    // Asynchronous Abort
    IRQ,  // IRQ disable
    FIQ,  // FIQ disable
    mode, // Processor mode to be ch
   
     
    // Single Data Transfer Flags:
    single_trans_f, // Data Transfer flags ( P, U, B, W, L):
    
    write_rd,
    write_rn,
    mem_en,
    br_en,
    
    ig_ex
    );
 
 
 
  
// ____________________________________________________________________________________________________
// ====================================================================================================
// ====================================================================================================
// ====================================================================================================
                                       /* ---- ALU ---- */
    
    // Permition to write:
    
  ALU alu(
    
    clk,rst,
    cu_execute,

    inst, // Defines the Instruction to execute

    Rn, // Rn Register
    Rm, // Rm Register
    Rs, // Rs Shift Register
    Rd, // Rd Result Register

    imm_shift, // Immediate offset Shift
    imm_OP_2,  // Operand 2 Immediate
    
        //  Branch:
    br_L,      // Link bit 
    br_offset, // Branch offset
    LR,
    PC,  

    I, // Enable Immediate
    update_flags, // Set condition codes    
    stype, // Shift Type
    
    single_trans_f, // Data Transfer flags ( P, U, B, W, L
    n, z, c, v,
    dout_mem, // Output data Memory (Read/Load)
    
    // Outputs
    w_n,w_z,w_c, w_v,
    
    w_LR,
    w_PC,
    w_Rd,
    w_Rn,
    din_mem,  // Input data Memory (Write/Store)
    addr_mem  // Mamory Address
    );
    
    
     
// ____________________________________________________________________________________________________
// ====================================================================================================
// ====================================================================================================
// ====================================================================================================
                                       /* ---- LEds controller ---- */    
  LEDs leds(
        
        clk,rst,
        led_en,

        Rd, // Defines the Register to display in LEDs

        out_leds
        );


    // - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - - 
    // - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - - 
                                /* Memory Controller */
     
        assign mem_wr = !single_trans_f[`L_I] & inst == `LD_ST;

        assign flash_addr_PC = PC[10:0];
  

endmodule
