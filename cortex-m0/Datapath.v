`timescale 1ns / 1ps

`include "Defines.v"

module Datapath(
    input wire clk,
    input wire rst,
    
    input wire wr_en,
    input wire cu_decode,
    
    // Control Signals
    input wire ld_sp,
    input wire ld_lr,
    input wire ld_pc,
    
    // Register Signal
    input wire ld_rd,
    
    // Program Status Registers Signals
    input wire ld_apsr,
    input wire ld_ipsr,
    
    // Priority Mask Register Signal
    input wire ld_primask
    );
  
// ____________________________________________________________________________________________________
// ====================================================================================================
// ====================================================================================================
// ====================================================================================================
                                /* Memory and Core Registers*/
  
    reg [31:0] base_addr;
    reg [31:0] w_data;
    wire [31:0] r_data;

    wire [31:0] w_SP;     // Write Stack Pointer 
    wire [31:0] w_LR;     // Write Link Register 
    wire [31:0] w_PC;     // Write Program Counter 
    
     
    wire [31:0] w_Rd;     // Write destanation Reg 
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
    wire [31:0] IR;       // Instruction Register
    
    wire [31:0] Rn;       // Rn
    wire [31:0] Rm;       // Rm
    wire [31:0] Rd;       // Destination Register
    wire [31:0] Rs;       // Shift Register
    
    wire n, z, c, v;      // Conditional Flags
    wire [ 5:0] IPSR;   // Exception Numbers
    
    wire PMask;           // Enable Priority
  
    initial begin
        base_addr <= 32'h00000004;
        w_data    <= 32'h00000000;
        
    end
      
    
    // - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - - 
    // - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - - 
    
    Memory mem(
            clk,
            rst, 
            wr_en,   
            PC,
            base_addr, 
            w_data, 
            IR,
            r_data
            );
              
    // - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - - 
    // - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - - 
               
    coreRegisters CoreReg(
    // System Signals
            clk, rst,
            
    // Control Signals
            ld_sp,
            ld_lr,
            ld_pc,
    
    // Register Signal
            ld_rd,
            
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
    
    // - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - - 
    // - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - - 
 
 
// ____________________________________________________________________________________________________
// ====================================================================================================
// ====================================================================================================
// ====================================================================================================
                                /* Instruction Register*/
  
    wire [4:0]inst;         // Instruction to Execute
    wire    I;         // Immediate Operand or Immediate Offset Enable     
    wire    S;         // Set condition codes
      
    wire [ 1:0]      stype; // Shift Type
    wire [ 4:0]  imm_shift; // Immediate offset Shift
    wire [11:0]   imm_OP_2; // Operand 2 Immediate
  
    wire br_L;             // Link bit 
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
   
    
    
   
 
 InstructionReg ins_reg(
   // - - -   - - -   - - -   - - -   - - -   - - -   - - -   - - -   - - -  
                       /* ---- INPUTS ---- */
    
   // System Signals:
    clk,
    rst,
    
    // Instruction Register:
    IR,
    
    // - - -   - - -   - - -   - - -   - - -   - - -   - - -   - - -   - - -  
                       /* ---- OUTPUTS ---- */
     inst, // Defines the Instruction to execute 
   
        I,         // Immediate Operand or Immediate Offset     
        S,         // Set condition codes    
    stype,         // Shift Type
   
    // Registers:
    addr_Rn,  // 1st Operand Register or base register   
    addr_Rd,  // Destination Register or source
    addr_Rm,  // Operand 2 Register
    addr_Rs,  // Register offset Shift
    
    // Immediates:
    imm_shift, // Immediate offset Shift
    imm_OP_2, // Operand 2 Immediate
   
   
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
    single_trans_f // Data Transfer flags ( P, U, B, W, L):
                  
    );
// - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - - 
// - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - - 
      
// ____________________________________________________________________________________________________
// ====================================================================================================
// ====================================================================================================
// ====================================================================================================
                                /*ALU*/
  
    wire [`ALU_OP_LEN:0] operation; // Operation to Execute

    assign operation = (I & (inst == `MOV_LAS)) ? `ALU_OP_LSR_IMM : 
                        (!I & (inst == `MOV_LAS)) ? `ALU_OP_LSR_REG : `ALU_OP_LEN'h0;
 
 ALU ALU (
   // - - -   - - -   - - -   - - -   - - -   - - -   - - -   - - -   - - -  
                       /* ---- INPUTS ---- */
   operation,
   Rm,
   Rs,
   Rd,
   imm_shift,
   c,
   z,
   n,
   v,
   // - - -   - - -   - - -   - - -   - - -   - - -   - - -   - - -   - - -  
                       /* ---- OUTPUTS ---- */
   Rm,
   c,
   z,
   n,
   v,
   w_Rd    
 );


 //================================================================
 // Fetch and Decode Test
 
 assign w_PC = 32'h00000004;
 
 
 //================================================================
 // Core Register Write Test
    /*
    assign w_SP = 32'h00000002; 
    assign w_LR = 32'hff00ff03; 
    assign w_PC = 32'h00000004;
    
    assign w_Rd = 32'h06fffff2;     
    assign addr_Rn = 4'h0;
    assign addr_Rm = 4'h1;
    assign addr_Rd = 4'h2;  

    assign { w_n, w_z, w_c, w_v } = {1'b1, 1'b1, 1'b1, 1'b1};
    assign w_IPSR = 6'h12;  
    assign w_PMask = 1'b1; 
    */
           
 //================================================================
 // Write memory Test
  /*             
     always @(negedge wr_en or posedge rst) begin
        
        if (rst)begin
            w_data <= 32'h00000004;        
        end 
        else if (!wr_en) begin
            w_data <= w_data + 32'h00000005;
        
        end
    end 
    */
    
 
endmodule
