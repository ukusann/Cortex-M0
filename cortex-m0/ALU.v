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
    input wire [31:0] Rd, // Rs Shift Register
    
    input wire [ 4:0]   imm_shift, // Immediate offset Shift
    input wire [11:0] imm_operand, // Operand 2 Immediate
    
    input wire        br_L,      // Link bit 
    input wire [23:0] br_offset_imm, // Branch offset  
    input wire [31:0] LR, // Link Register
    input wire [31:0] PC, // Program Counter Register
    
    input wire              IMM, // Enable Immediate
    input wire                S, // Set condition codes    
    input wire [ 1:0]     stype, // Shift Type
    
    input wire [4:0] single_trans_f,
    
    input wire in_n, 
    input wire in_z, 
    input wire in_c, 
    input wire in_v,
   
    input wire [31:0] dout_mem, // Output data Memory (Read/Load) 
   
   
    output wire out_n, 
    output wire out_z, 
    output wire out_c, 
    output wire out_v,
   
    output wire [31:0] w_LR,     // Write Link Register 
    output wire [31:0] w_PC,     // Write Program Counter 
     
    output wire [31:0] w_Rd,     // Write Result Reg
    output wire [31:0] w_Rn,     // Base Offset Reg
    
    output wire [31:0] din_mem,  // Input data Memory (Write/Store)
    output wire [31:0] addr_mem  // Mamory Address
    );
    
    
    wire inst_mov_las_en;
    wire inst_add_en;       // enable the add operation
    wire inst_sub_en;       // enable the sub operation
    wire inst_and_en;       // enable the and operation    
    wire inst_or_en;        // enable the  or operation
    wire inst_xor_en;       // enable the xor operation
    wire inst_bic_en;       // enable the bic operation
    wire inst_mov_en;       // enable the mov operation
    
    wire ld_st_en;          // enable load/store operation
    wire no_inst;           // No Instruction
    
    // Branch Operation Enable
    wire inst_branch, inst_branch_reg, inst_eret;

   
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
            clk, rst,             // System Signals
           (cu_execute & inst_mov_las_en),// Condition to Execute Operation
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
            (cu_execute & inst_add_en), // Condition to Execute Operation
            IMM,                 // Immediate flag
            instruction,         // Instruction
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
            (cu_execute & inst_sub_en), // Condition to Execute Operation
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
            (cu_execute & inst_and_en), // Condition to Execute Operation
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
            (cu_execute & inst_or_en), // Condition to Execute Operation
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
            (cu_execute & inst_xor_en), // Condition to Execute Operation
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
                            /* ---- BIC ---- */
    
    wire [31:0] Rd_bic;
    wire c_bic;
    wire z_bic;
    wire n_bic;
    op_bic BIC(
        // Inputs:
            clk,rst,
    
            (cu_execute & inst_bic_en), // Condition to Execute Operation
            IMM,                 // Immediate flag
            S,                   // Set flags
            Rn,                  // Register Rn
            imm_operand,         // Immediate Operand
            imm_shift,           // Immediate Shift
            stype,               // Shift Type 
            Rm,                  // Register Rm
            in_c, in_z ,in_n,    // Flags

        // Output
            Rd_bic,              // Destination Reg
            c_bic, z_bic, n_bic  // Flags
    );

    // ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____ 
    // ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ---- 
                            /* ---- MOV ---- */
    
    wire [31:0] Rd_mov;
    wire c_mov;
    wire z_mov;
    wire n_mov;
    op_mov MOV(
        // Inputs:
            clk,rst,
    
            (cu_execute & inst_mov_en), // Condition to Execute Operation
            IMM,                 // Immediate flag
            S,                   // Set flags
            Rn,                  // Register Rn
            imm_operand,         // Immediate Operand
            imm_shift,           // Immediate Shift
            stype,               // Shift Type 
            Rm,                  // Register Rm
            in_c, in_z ,in_n,    // Flags

        // Output
            Rd_mov,              // Destination Reg
            c_mov, z_mov, n_mov  // Flags
    );

    // ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____ 
    // ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ---- 
                            /* ---- LD/ST ---- */
    
    wire [31:0] Rn_ld_st;
    op_ld_st LD_ST(
        // Inputs:
            clk,rst,
    
            (cu_execute & ld_st_en),
            single_trans_f,
            Rn,
            (IMM) ? {20'd0, imm_operand}: Rm, // Operand 2
   
        // Output
            Rn_ld_st,
            addr_mem
    );
    
 
 
    // ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____ 
    // ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ---- 
                            /* ---- B(L)(X)(COND) ---- */
    // Write Program Counter
    wire [31:0] pc_b;
    wire [31:0] pc_bx;
    wire [31:0] lr_b;
    wire [31:0] lr_bx; 
    
    op_branch BRANCH_LABEL(
        // Inputs
            clk, rst,
            (cu_execute & inst_branch), // Condition to Execute Operation
            br_L,       // Link Condition
        
            {8'h00, br_offset_imm}, // Offset
            PC,         // Current Program Couter
        // Outputs   
            pc_b,      // New Program Counter
            lr_b      // New Link Register
    
    );
    
    op_branch_reg BRANCH_Reg(
        // Inputs
            clk, rst,
            (cu_execute & inst_branch_reg), // Condition to Execute Operation
            br_L,       // Link Condition
        
            Rm,         // Register
            PC,         // Current Program Couter
        // Outputs   
            pc_bx,        // New Program Counter
            lr_bx      // New Link Register
    );
      
    // ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____ 
    // ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ---- 
                                
    
    
    // ==================================================================================
    // ==================================================================================
                        /* --- Instrution's Operation Enable --- */
                        
    assign inst_mov_las_en = (instruction == `MOV_LAS);
    assign inst_add_en = (instruction == `ADD || instruction == `ADC);
    assign inst_sub_en = (instruction == `SUB || instruction == `SBC);
    assign inst_and_en = (instruction == `AND);
    assign inst_or_en  = (instruction == `ORR);
    assign inst_xor_en = (instruction == `EOR);
    assign inst_bic_en = (instruction == `BIC);
    assign inst_mov_en = (instruction == `MOV);
    
    // Load and Store
    assign ld_st_en = (instruction == `LD_ST);
    
    // Branch
    assign inst_branch     = (instruction == `B);
    assign inst_branch_reg = (instruction == `BX);
    assign inst_eret       = (instruction == `ERET);
    
    // ==================================================================================
    // ==================================================================================
                        /* --- Assigns Outputs --- */

    // Result Register:
    assign w_Rd = (ld_st_en & single_trans_f[`L_I] )? dout_mem   :
                                  inst_mov_las_en   ? Rd_mov_lad :
                                  inst_add_en       ? Rd_add     :
                                  inst_sub_en       ? Rd_sub     :
                                  inst_and_en       ? Rd_and     :
                                  inst_or_en        ? Rd_or      :
                                  inst_xor_en       ? Rd_xor     :
                                  inst_bic_en       ? Rd_bic     :
                                  inst_mov_en       ? Rd_mov     : 
                                  32'h0;
    
    // Base Offset Register:
    assign w_Rn = (ld_st_en)? Rn_ld_st :
                  32'h0;

    // Input data Memory (Write/Store)
    assign  din_mem = (ld_st_en & !single_trans_f[`L_I] )? Rd :
                       32'd0; 
    

    //  Carry Flag
    assign out_c = inst_mov_las_en ? c_mov_lad :
                    inst_add_en    ? c_add     :
                    inst_sub_en    ? c_sub     :
                    inst_and_en    ? c_and     :
                    inst_or_en     ? c_or      :
                    inst_xor_en    ? c_xor     :
                    inst_bic_en    ? c_bic     :
                    inst_mov_en    ? c_mov     :
                    in_c;
                  
    // Zero Flag                
    assign out_z = inst_mov_las_en ? z_mov_lad :
                    inst_add_en    ? z_add     :
                    inst_sub_en    ? z_sub     :
                    inst_and_en    ? z_and     :
                    inst_or_en     ? z_or      :
                    inst_xor_en    ? z_xor     :
                    inst_bic_en    ? z_bic     :
                    inst_mov_en    ? z_mov     :
                    in_z;

    // Negative Flag
    assign out_n = inst_mov_las_en ? n_mov_lad :
                    inst_add_en    ? n_add     :     
                    inst_sub_en    ? n_sub     : 
                    inst_and_en    ? n_and     :
                    inst_or_en     ? n_or      :
                    inst_xor_en    ? n_xor     : 
                    inst_bic_en    ? n_bic     :
                    inst_mov_en    ? n_mov     :
                    in_n;

    // Overflow Flag
    assign out_v =  in_v;

   // Write Program Counter
   assign w_PC = inst_branch_reg ? pc_bx :
                 inst_branch     ? pc_b  :
                 32'd0;

   
   // Link Register
   assign w_LR = inst_branch_reg ? lr_bx :
                 inst_branch     ? lr_b  :
                 32'hffffffff;              
                 
endmodule
