`timescale 1ns / 1ps

`include "Defines.v"

module LSR(
    input wire [`ALU_OP_LEN:0] op,
    input wire [31:0] rm,
    input wire [31:0] shift,
    output wire [31:0] result,
    output wire carry,
    output wire zero, 
    output wire negative 
    );
    
    assign result = (op == `ALU_OP_LSR_IMM || op == `ALU_OP_LSR_REG) ? rm >> shift : 32'h0;
    assign carry = (op == `ALU_OP_LSR_IMM || op == `ALU_OP_LSR_REG) ? rm[shift - 1] : 1'b0; 
    assign zero = (op == `ALU_OP_LSR_IMM || op == `ALU_OP_LSR_REG) ? (result == 32'h0) : 1'b0; 
    assign negative = (op == `ALU_OP_LSR_IMM || op == `ALU_OP_LSR_REG) ? result[31] : 1'b0; 
endmodule

module ALU(
        input wire [`ALU_OP_LEN:0] operation,
        input wire [31:0] i_rm,
        input wire [31:0] i_rs,
        input wire [31:0] i_rd,
        input wire [4:0] i_imm5,
        input wire i_c,
        input wire i_z,
        input wire i_n,
        input wire i_v,
        output wire[31:0] o_rm,
        output wire o_c,
        output wire o_z,
        output wire o_n,
        output wire o_v,
        output wire [31:0] o_rd
        );

    // ==============================================================
    // ===================== Internal Variables =====================
    wire [31:0] b, c;
    wire [31:0] result_LSR;
    // ==============================================================
    // ========================= Operations =========================
    assign b = (operation == `ALU_OP_LSR_IMM || operation == `ALU_OP_LSR_REG) ? i_rm :32'h0;
    assign c = (operation == `ALU_OP_LSR_IMM) ? {27'b0, i_imm5} : 
               (operation == `ALU_OP_LSR_REG) ? i_rs : 32'h0;
    
    LSR log_shift_right (operation, b, c, result_LSR, o_c, o_z, o_n);

    assign o_rd = (operation == `ALU_OP_LSR_IMM || operation == `ALU_OP_LSR_REG) ? result_LSR : i_rd;
endmodule