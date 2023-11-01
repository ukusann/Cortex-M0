`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2023 11:31:06 AM
// Design Name: 
// Module Name: InstructionReg
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

// Instructions 
`define ADD       5'h00
`define ADC       5'h01
`define SUB       5'h02
`define SBC       5'h03
`define AND       5'h04
`define ORR       5'h05
`define EOR       5'h06
`define BIC       5'h07
`define MOV_LAS   5'h08
`define CPSI      5'h09
`define WFI       5'h0a
`define ERET      5'h0b
`define BX        5'h0c
`define B         5'h0d
`define LD        5'h0e
`define ST        5'h0f
`define NO_INST   5'h1f
 
 
 // OPCODES:    
`define OP_ADCS  4'b0101    // Add with Carry   
`define OP_ADDS  4'b0100    // Add without Carry 
`define OP_SUBS  4'b0010    // Sub without Carry 
`define OP_SBCS  4'b0110    // Sub with Carry 
`define OP_ANDS  4'b0000    // Logical AND 
`define OP_ORRS  4'b1100    // Logical OR 
`define OP_EORS  4'b0001    // Logical XOR

`define OP_BIC       4'b1110 // Performs an Logical AND with the logical negation of the corresponding bits 
`define OP_MOV_LAS   4'b1101 // Mov and Logical and Arithemetics Shifts   
`define OP_MOVW_CPSI 4'b1000 // Mov word (16 bits) and CPSIE and CPSID
`define OP_BX        4'b1001 // Branch and Exchange
`define OP_ERET      4'b1011 // Exceptions Return


// COND defines:
`define COND_EQ 4'h0 // Equal
`define COND_NE 4'h1 // NOT Equal
`define COND_CS 4'h2 // CARRY SET
`define COND_CC 4'h3 // CARRY CLEAR
`define COND_MI 4'h4 // Negative
`define COND_PL 4'h5 // Negative or Zero
`define COND_VS 4'h6 // OVERFLOW has occurred
`define COND_VC 4'h7 // OVERFLOW has not occurred
`define COND_AL 4'he // Always (ignor flags)
`define COND_UN 4'hF // Unconditional Instruction

// Shift Types:
`define STYPE_LL 2'b00 // Logical Shift Left
`define STYPE_LR 2'b01 // Logical Shift Right
`define STYPE_AR 2'b10 // Logical Arithmetic Shift Right
`define STYPE_RR 2'b11 // Logical Rotate Right


// _________________________________________________________________________________________________________
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// =========================================================================================================
                        /* -------- Module Instrution Register Begin: -------- */


module InstructionReg(
   // - - -   - - -   - - -   - - -   - - -   - - -   - - -   - - -   - - -  
                       /* ---- INPUTS ---- */
    
   // System Signals:
    input wire clk,
    input wire rst,
    
    // Instruction Register:
    input wire [31:0] IR,
    
    input wire n, 
    input wire z, 
    input wire c, 
    input wire v,
    
    
    // - - -   - - -   - - -   - - -   - - -   - - -   - - -   - - -   - - -  
                       /* ---- OUTPUTS ---- */
    output wire [4:0] instrution, // Defines the Instruction to execute
    output wire IMM,          // Enable Immediate
    output wire    S,         // Set condition codes    
    output wire [ 1:0] stype, // Shift Type
   
    // Registers:
    output wire [ 3:0] addr_Rn,  // 1st Operand Register or base register   
    output wire [ 3:0] addr_Rd,  // Destination Register or source
    output wire [ 3:0] addr_Rm,  // Operand 2 Register
    output wire [ 3:0] addr_Rs,  // Register offset Shift
    
    // Immediates:
    output wire [ 4:0]  imm5, // Immediate offset Shift
    output wire [11:0] imm12, // Operand 2 Immediate
   
   
    //  Branch:
    output wire Link,               // Link bit 
    output wire [23:0] br_offset24, // Branch offset  
   
   
    // Unconditional Instruction Data and Flags:
    output wire [ 1:0]  imod, // Interrupt mode
    output wire M,            // Change mode signal
    output wire A,            // Asynchronous Abort
    output wire IRQ,          // IRQ disable
    output wire FIQ,          // FIQ disable
    output wire [4:0]  mode,  // Processor mode to be ch
   
     
    // Single Data Transfer Flags:
    output wire [4:0] singlet_flags, // Data Transfer flags ( P, U, B, W, L):
                            //      P: Pre/Post Indexing bit
                            //      U: Up/Down bit
                            //      B: Byte/Word bit
                            //      W: Write-back bit
                            //      L: Load/Store bit
                        
   output  wire ig_ex
    );

    
    wire data_proc;     // Data-processing and miscellaneous instructios
    wire single_transf; // Load/Store Word, Unsigned Byte IMMEDIAT, LITERAL, REGISTERS
    wire uncond;        // Unconditions Instructions
    wire branch;        // Branch without Registers, branch with link and block data trasfer
    
    
    // ==============================================================
    // ========================= OUTPUTS ============================
    
    
    // ==============================================================
    // ===================== Internal Variables =====================
    
    /* Common to all instruction types */
    wire [ 3:0] cond;      // Condition field
    wire [ 1:0 ]  op;      // [op0, op1] to define instruction type  
 
    /* Data processing and Uncondition Instructions */
    wire [ 3:0] opcode;    // Opcode

    initial begin
      
    end
    
    
    
    // ==============================================================
    // ==============================================================
            /* ----- Assign Instructions TYPES -----*/
    
    assign cond     = IR[31:28];
    assign op       = IR[27:26];
    assign I        = IR[25];
    
    
    assign data_proc      = cond != `COND_UN && op == 2'b00; // Data-processing and miscellaneous instructios
    assign single_transf  = cond != `COND_UN && op == 2'b01; // Load/Store Word, Unsigned Byte IMMEDIAT, LITERAL, REGISTERS
    assign uncond         = cond == `COND_UN && op == 2'b00; // Unconditions Instructions
    assign branch         = cond != `COND_UN && op == 2'b10; // Branch without Registers, branch with link and block data trasfer
    
    
    // ==============================================================
    // ==============================================================
             /* ----- Assign Data and Flags Outputs -----*/
    
    // Most Used 
    assign opcode   = (data_proc | uncond)        ? IR[24:21] : 4'h0;
    assign S        = (data_proc | uncond)        ?    IR[20] : 1'b0;
    assign addr_Rn  = (data_proc | single_transf) ? IR[19:16] : 4'h0;
    assign addr_Rd  = (data_proc | single_transf) ? IR[15:12] : 4'h0;
    assign I_s4     = (        data_proc        ) ?     IR[4] : 1'b0;   
    
  
    
    // Operand 2:
    assign IMM = (!I_s4 && opcode == `OP_MOV_LAS) | (data_proc &  I) | (single_transf & !I);
    
    // Operand 2 = Register:
    
    assign addr_Rs  = (I_s4 & data_proc) ? IR[11: 8] : 4'h0;
    assign addr_Rm  = ( !IMM && !uncond ) ? IR[3:0] : 4'h0;
    assign stype    = IR[ 6: 5];
    
    // Operand 2 = Immediate:
    assign imm12     = (IMM) ? IR[11:0] : 12'b000000000000;
    assign imm5      = (IMM) ? IR[11: 7] : 5'h00;
  
    // General Data and Flags Uncondition Instructions:
    assign imod     = (uncond) ? IR[19:18] : 8'h0;
    assign M        = (uncond) ?    IR[17] : 1'b0;
    // assign imm8     = (uncond) ? IR[16: 9] : 8'h0;
    assign A        = (uncond) ?     IR[8] : 1'b0;
    assign IRQ      = (uncond) ?     IR[7] : 1'b0;
    assign FIQ      = (uncond) ?     IR[6] : 1'b0;
    assign mode     = (uncond) ?   IR[4:0] : 5'h0;
    
    
    assign Link        = (branch) ?   IR[24] :  1'b0;
    assign br_offset24 = (branch) ? IR[23:0] : 23'h0;
    
    
    // Single Transfer flags
    assign singlet_flags = (single_transf) ? IR[24:20]: 5'b00000;

    
    // ==============================================================
    // ==============================================================
             /* ----- Definition of the Instruction -----*/
    
    
    assign instrution = (data_proc & (opcode == `OP_MOV_LAS)) ? `MOV_LAS :
                        (               branch              ) ? `B :
                        (   data_proc & (opcode == `OP_BX)  ) ? `BX :
                        (  data_proc & (opcode == `OP_ERET) ) ? `OP_ERET :
                        `NO_INST;
    
    
    // ==============================================================
    // ==============================================================
                    /* ---- Condition Compare ---- */
    
    
    assign ig_ex = ( instrution == `NO_INST ) ? 1'b1 : // No Instruction Defined
                   (    cond == `COND_UN    ) ? 1'b0 : // Unconditional Instruction
                   (    cond == `COND_AL    ) ? 1'b0 : // Always (ignor flags)
                   ( cond == `COND_EQ &&  z ) ? 1'b0 : // Equal
                   ( cond == `COND_NE && !z ) ? 1'b0 : // NOT Equal
                   ( cond == `COND_CS &&  c ) ? 1'b0 : // CARRY SET
                   ( cond == `COND_CC && !c ) ? 1'b0 : // CARRY CLEAR
                   ( cond == `COND_MI &&  n ) ? 1'b0 : // Negative
                   ( cond == `COND_PL && !n ) ? 1'b0 : // Positive or Zero
                   ( cond == `COND_VS &&  v ) ? 1'b0 : // OVERFLOW has occurred
                   ( cond == `COND_VC && !v ) ? 1'b0 : // OVERFLOW has not occurred
                   1'b1; // Skip the execution State
                        
    
endmodule



