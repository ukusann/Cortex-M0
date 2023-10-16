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
    
    input wire              IMM, // Enable Immediate
    input wire                S, // Set condition codes    
    input wire [ 1:0]     stype, // Shift Type
    
    
    output wire in_n, 
    output wire in_z, 
    output wire in_c, 
    output wire in_v,
    
    output wire out_n, 
    output wire out_z, 
    output wire out_c, 
    output wire out_v,
    output wire [31:0] Rd
    
    );
    
    wire inst_mov_las_en;
   
    // ==================================================================================
    // ==================================================================================
                    /* ---- LSL(S),  LSR(S), ASR(S), MOV(S) ---- */
    movLogicArithShift MOV_LAS(
        
        // Inputs:
            clk,rst,             // System Signals
           inst_mov_las_en,      // Condition to Execute Operation
            S,                   // Set flags
            Rm,                  // Register Rm
            
            (IMM) ? {3'b000,imm_shift}: Rs, // Operand 2
            stype,               // Shift Type 
            in_c, in_z ,in_n,    // Flags
    
        // Output
            Rd,                  // Destination Reg
            out_c, out_z, out_n  // Flags
    );
    
    
    
    
    // ==================================================================================
    // ==================================================================================
                        /* --- Instrution's Operation Enable --- */
                        
    assign inst_mov_las_en = cu_execute && (instrution == `MOV_LAS);
    
                           
    
endmodule
