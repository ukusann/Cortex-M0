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
    
    input wire [4:0] instruction, // Defines the Instruction to execute
    
    input wire [31:0] Rn, // Rn Register
    input wire [31:0] Rm, // Rm Register
    input wire [ 7:0] Rs, // Rs Shift Register
    input wire [ 7:0] Rd, // Rd Register
    
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
     
    output wire [31:0] new_Rd
    
    );
    
    wire inst_mov_las_en;   // enable the mov/shift/rotate operation
    wire inst_add_en;       // enable the add operation
    wire inst_sub_en;       // enable the sub operation
    wire inst_and_en;       // enable the and operation    
    wire inst_or_en;        // enable the  or operation
    wire inst_xor_en;       // enable the xor operation

    // Branch Operation Enable
    wire inst_brach, inst_brach_x, inst_eret;
   
    // ==================================================================================
    // ==================================================================================
    
    // ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____ 
    // ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ---- 
                    /* ---- LSL(S),  LSR(S), ASR(S), MOV(S) ---- */
    wire [31:0] Rd_mov_lad;
    wire c_mov_lad;
    wire z_mov_lad;
    wire n_mov_lad;
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
            Rd_mov_lad,          // Destination Reg
            c_mov_lad, z_mov_lad, n_mov_lad  // Flags
    );
    
    // ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____ 
    // ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ---- 
                    /* ---- ADCS and ADDS ---- */
    wire [31:0] Rd_add;
    wire c_add;
    wire z_add;
    wire n_add;
    op_add ADD(
        
        // Inputs:
            clk,rst,             // System Signals
            inst_add_en,         // Condition to Execute Operation
            IMM,                 // Immediate flag
            instruction,          // Instruction
            S,                   // Set flags
            Rn,                  // Register Rn
            imm_operand,         // Immediate Operand
            imm_shift,           // Immediate Shift
            stype,               // Shift Type 
            Rm,                  // Register Rm
            in_c, in_z ,in_n,    // Flags

        // Output
            Rd_add,          // Destination Reg
            c_add, z_add, n_add  // Flags
    );
    
    // ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____ 
    // ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ---- 
                    /* ---- SBC and SUB ---- */
    wire [31:0] Rd_sub;
    wire c_sub;
    wire z_sub;
    wire n_sub;
    op_sub SUB(
        
        // Inputs:
            clk,rst,             // System Signals
            inst_sub_en,         // Condition to Execute Operation
            IMM,                 // Immediate flag
            instruction,          // Instruction
            S,                   // Set flags
            Rn,                  // Register Rn
            imm_operand,         // Immediate Operand
            imm_shift,           // Immediate Shift
            stype,               // Shift Type 
            Rm,                  // Register Rm
            in_c, in_z ,in_n,    // Flags

        // Output
            Rd_sub,          // Destination Reg
            c_sub, z_sub, n_sub  // Flags
    );

    // ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____ 
    // ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ---- 
                    /* ---- AND ---- */
    wire [31:0] Rd_and;
    wire c_and;
    wire z_and;
    wire n_and;
    op_and AND(
        
        // Inputs:
            clk,rst,             // System Signals
            inst_and_en,         // Condition to Execute Operation
            IMM,                 // Immediate flag
            S,                   // Set flags
            Rn,                  // Register Rn
            imm_operand,         // Immediate Operand
            imm_shift,           // Immediate Shift
            stype,               // Shift Type 
            Rm,                  // Register Rm
            in_c, in_z ,in_n,    // Flags

        // Output
            Rd_and,              // Destination Reg
            c_and, z_and, n_and  // Flags
    );

        // ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____ 
    // ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ---- 
                    /* ---- OR ---- */
    wire [31:0] Rd_or;
    wire c_or;
    wire z_or;
    wire n_or;
    op_or OR(
        
        // Inputs:
            clk,rst,             // System Signals
            inst_or_en,         // Condition to Execute Operation
            IMM,                 // Immediate flag
            S,                   // Set flags
            Rn,                  // Register Rn
            imm_operand,         // Immediate Operand
            imm_shift,           // Immediate Shift
            stype,               // Shift Type 
            Rm,                  // Register Rm
            in_c, in_z ,in_n,    // Flags

        // Output
            Rd_or,              // Destination Reg
            c_or, z_or, n_or  // Flags
    );

        // ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____ 
    // ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ---- 
                    /* ---- XOR ---- */
    wire [31:0] Rd_xor;
    wire c_xor;
    wire z_xor;
    wire n_xor;
    op_xor XOR(
        
        // Inputs:
            clk,rst,             // System Signals
            inst_xor_en,         // Condition to Execute Operation
            IMM,                 // Immediate flag
            S,                   // Set flags
            Rn,                  // Register Rn
            imm_operand,         // Immediate Operand
            imm_shift,           // Immediate Shift
            stype,               // Shift Type 
            Rm,                  // Register Rm
            in_c, in_z ,in_n,    // Flags

        // Output
            Rd_xor,              // Destination Reg
            c_xor, z_xor, n_xor  // Flags
    );

    // ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____ 
    // ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ---- 
                            /* ---- B(L)(X)(COND), ERET ---- */
   /*  
    op_branch BRANCH(
        // Inputs
            inst_brach, // Condition to Execute Operation
            br_L,       // Link Condition
        
            {8'h00, br_offset_imm}, // Offset
            PC,         // Current Program Couter
        // Outputs   
            w_PC,      // New Program Counter
            w_LR      // New Link Register
    
    );
    
    op_branch BRANCH_X(
        // Inputs
            inst_brach_x, // Condition to Execute Operation
            br_L,       // Link Condition
        
            Rm,         // Offset
            PC,         // Current Program Couter
        // Outputs   
            new_Rd,        // New Program Counter
            w_LR      // New Link Register
    );
     */ 
    // ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____ 
    // ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ---- 
                                
    
    
    // ==================================================================================
    // ==================================================================================
                        /* --- instruction's Operation Enable --- */
    // Data processing                        
    assign inst_mov_las_en = cu_execute && (instruction == `MOV_LAS);
    assign inst_add_en = cu_execute && (instruction == `ADD || instruction == `ADC);
    assign inst_sub_en = cu_execute && (instruction == `SUB || instruction == `SBC);
    assign inst_and_en = cu_execute && (instruction == `AND);
    assign inst_or_en  = cu_execute && (instruction == `ORR);
    assign inst_xor_en = cu_execute && (instruction == `EOR);

    // Branch
    assign inst_brach   = cu_execute && (instruction == `B);
    assign inst_brach_x = cu_execute && (instruction == `BX);
    assign inst_eret    = cu_execute && (instruction == `ERET);
                           
    assign new_Rd = inst_mov_las_en ? Rd_mov_lad :
                    inst_add_en     ? Rd_add     :
                    inst_sub_en     ? Rd_sub     :
                    inst_and_en     ? Rd_and     :
                    inst_or_en      ? Rd_or      :
                    inst_xor_en     ? Rd_xor     : 
                    Rd;

    assign out_c = inst_mov_las_en ? c_mov_lad  :
                    inst_add_en    ? c_add      :
                    inst_sub_en    ? c_sub      :
                    inst_and_en    ? c_and      :
                    inst_or_en     ? c_or       :
                    inst_xor_en    ? c_xor      :
                    in_c;
                    
    assign out_z = inst_mov_las_en ? z_mov_lad :
                    inst_add_en    ? z_add     :
                    inst_sub_en    ? z_sub     :
                    inst_and_en    ? z_and     :
                    inst_or_en     ? z_or      :
                    inst_xor_en    ? z_xor     :
                    in_z;

    assign out_n = inst_mov_las_en ? n_mov_lad :
                    inst_add_en    ? n_add     :     
                    inst_sub_en    ? n_sub     : 
                    inst_and_en    ? n_and     :
                    inst_or_en     ? n_or      :
                    inst_xor_en    ? n_xor     : 
                    in_n;

    // ==================================================================================
    // ==================================================================================
                        /* --- Assigns Outputs --- */
    
      
   

endmodule
