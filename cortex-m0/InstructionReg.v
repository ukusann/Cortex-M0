`timescale 1ns / 1ps

`include "Defines.v"

// _________________________________________________________________________________________________________
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// =========================================================================================================
                        /* -------- Module Instruction Register Begin: -------- */


module InstructionReg(
   // - - -   - - -   - - -   - - -   - - -   - - -   - - -   - - -   - - -  
                       /* ---- INPUTS ---- */
    
   // System Signals:
    input wire clk,
    input wire rst,
    
    // Instruction Register:
    input wire [31:0] IR,
    
    // - - -   - - -   - - -   - - -   - - -   - - -   - - -   - - -   - - -  
                       /* ---- OUTPUTS ---- */
    output wire [4:0] instruction, // Defines the Instruction to execute
    output wire IMM,               // Enable Immediate
    output wire    S,              // Set condition codes    
    output wire [ 1:0] stype,      // Shift Type
   
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
    output wire [4:0] singlet_flags // Data Transfer flags ( P, U, B, W, L):
                            //      P: Pre/Post Indexing bit
                            //      U: Up/Down bit
                            //      B: Byte/Word bit
                            //      W: Write-back bit
                            //      L: Load/Store bit
   
    );

    // Control Flags
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
    assign addr_Rm  = ( !IMM || opcode == `OP_MOV_LAS ) ? IR[3:0] : 4'h0;
    assign stype    = ( !IMM  ) ? IR[ 6: 5] : `STYPE_RR;
    
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
    
    
    assign instruction = (data_proc & (opcode == `OP_MOV_LAS)) ? `MOV_LAS : `NO_INST;
    

endmodule



