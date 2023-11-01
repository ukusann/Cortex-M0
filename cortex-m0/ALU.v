`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2023 01:57:55 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input wire clk,
    input wire rst,
    input wire cu_execute,
    
    input wire [4:0] instrution, // Defines the Instruction to execute
    
    input wire [31:0] Rn, // Rn Register
    input wire [31:0] Rm, // Rm Register
    input wire [ 7:0] Rs, // Rs Shift Register
    
    input wire [ 4:0]   imm_shift, // Immediate offset Shift
    input wire [11:0] imm_operand, // Operand 2 Immediate
    
    input wire        br_L,      // Link bit 
    input wire [23:0] br_offset_imm, // Branch offset  
    input wire [31:0] LR, // Link Register
    input wire [31:0] PC, // Program Counter Register
    
    input wire              IMM, // Enable Immediate
    input wire                S, // Set condition codes    
    input wire [ 1:0]     stype, // Shift Type
    
    
    input wire in_n, 
    input wire in_z, 
    input wire in_c, 
    input wire in_v,
   
   
    output wire out_n, 
    output wire out_z, 
    output wire out_c, 
    output wire out_v,
   
    output wire [31:0] w_LR,     // Write Link Register 
    output wire [31:0] w_PC,     // Write Program Counter 
     
    output wire [31:0] Rd
    
    );
    
    
    wire [31:0] rd_mov_las;
    wire [31:0] rd_bx;
    
    wire inst_mov_las_en;
    
    // Branch Operation Enable
    wire inst_branch, inst_branch_x, inst_eret;

   
    // ==================================================================================
    // ==================================================================================
    
    // ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____ 
    // ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ---- 
                    /* ---- LSL(S),  LSR(S), ASR(S), MOV(S) ---- */
    movLogicArithShift MOV_LAS(
        
        // Inputs:
            clk,rst,             // System Signals
           inst_mov_las_en,      // Condition to Execute Operation
            S,                   // Set flags
            Rm,                  // Register Rm
            
            (IMM) ? {3'b000, imm_shift}: Rs, // Operand 2
            stype,               // Shift Type 
            in_c, in_z ,in_n,    // Flags
    
        // Output
            rd_mov_las,          // Destination Reg
            out_c, out_z, out_n  // Flags
    );
    
    
    // ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____ 
    // ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ---- 
                            /* ---- B(L)(X)(COND), ERET ---- */
    
    op_branch BRANCH(
        // Inputs
            inst_branch, // Condition to Execute Operation
            br_L,       // Link Condition
        
            {8'h00, br_offset_imm}, // Offset
            PC,         // Current Program Couter
        // Outputs   
            w_PC,      // New Program Counter
            w_LR      // New Link Register
    
    );
    
    op_branch BRANCH_X(
        // Inputs
            inst_branch_x, // Condition to Execute Operation
            br_L,       // Link Condition
        
            Rm,         // Offset
            PC,         // Current Program Couter
        // Outputs   
            rd_bx,        // New Program Counter
            w_LR      // New Link Register
    );
      
    // ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____ 
    // ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ---- 
                                
    
    
    // ==================================================================================
    // ==================================================================================
                        /* --- Instrution's Operation Enable --- */
                        
    assign inst_mov_las_en = cu_execute && (instrution == `MOV_LAS);
    
    // Branch
    assign inst_branch   = cu_execute && (instrution == `B);
    assign inst_branch_x = cu_execute && (instrution == `BX);
    assign inst_eret    = cu_execute && (instrution == `ERET);
                           
   
    // ==================================================================================
    // ==================================================================================
                        /* --- Assigns Outputs --- */
    
      
   assign Rd = (instrution == `BX)? rd_bx: 
               (instrution == `MOV_LAS)? rd_mov_las :
               32'b0;

endmodule
