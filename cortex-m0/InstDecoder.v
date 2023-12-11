`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2023 05:57:14 PM
// Design Name: 
// Module Name: InstDecoder
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
    
`include "Defines.v"
// _________________________________________________________________________________________________________
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// =========================================================================================================
                        /* -------- Module Instrution Register Begin: -------- */


module InstDecoder(
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
   
   output wire write_rd,    // write Result Register
   output wire write_rn,    // write Base Offset Reg
   output wire mem_en,
   output wire br_en,       // Branch Instruction
                       
   output wire ig_ex        // Ignore Instruction
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
    assign addr_Rm  = ( (!IMM || opcode == `OP_MOV_LAS) && (single_transf | data_proc) ) ? IR[3:0] : 4'h0;
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
                        (            single_transf          ) ? `LD_ST :
                        (               branch              ) ? `B :
                        (   data_proc & (opcode == `OP_BX)  ) ? `BX :
                        (  data_proc & (opcode == `OP_ERET) ) ? `OP_ERET :
                        (data_proc & (opcode == `OP_ADDS)   ) ? `ADD : 
                        (data_proc & (opcode == `OP_ADCS)   ) ? `ADC :
                        (data_proc & (opcode == `OP_SBCS)   ) ? `SBC :
                        (data_proc & (opcode == `OP_SUBS)   ) ? `SUB :
                        (data_proc & (opcode == `OP_ANDS)   ) ? `AND :
                        (data_proc & (opcode == `OP_ORRS)   ) ? `ORR :
                        (data_proc & (opcode == `OP_EORS)   ) ? `EOR :
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
                        

    assign write_rd = !ig_ex & instrution != `BX & instrution != `ERET & instrution != `WFI & 
                       ((single_transf & singlet_flags[`L_I] ) | data_proc);
    assign br_en    = !ig_ex & (instrution == `B || instrution == `BX || instrution == `ERET );    
    assign write_rn = !ig_ex & single_transf & singlet_flags[`W_I];
    assign mem_en   = !ig_ex & single_transf;
    
endmodule
