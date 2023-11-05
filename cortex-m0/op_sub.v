`timescale 1ns / 1ps

`include "Defines.v"

module op_sub(
    
    input wire clk,
    input wire rst,
    
    
    input wire en_inst,
    input wire IMM, 
    input wire [4:0] instruction,
    input wire S,
    input wire [31:0] Rn,
    input wire [11:0] imm_operand,
    input wire [ 4:0] imm_shift,
    input wire [1:0] stype, 
    input wire [31:0] Rm,
    input wire carry_in,
    input wire zero_in,
    input wire neg_in,
    
    output wire [31:0] Rd,
    
    output wire carry_out,
    output wire zero_out,
    output wire neg_out
    );
    
    wire sbc_imm;
    wire sub_imm;
    wire sbc_reg;
    wire sub_reg;
    
    wire rrext; // rotate right with extend
    wire srval; // shift or rotate by value

    reg [31:0]res;
    reg c;   

    initial begin
        res = 32'd0;
        c = 1'b0; 
    end
    
    // ====================================================================
    // ====================================================================
                  /* ---- Define the Operation ---- */
    assign sbc_imm =  IMM & (instruction == `SBC);
    assign sub_imm =  IMM & (instruction == `SUB);
    assign sbc_reg = !IMM & (instruction == `SBC);
    assign sub_reg = !IMM & (instruction == `SUB);

    assign rrext = (sbc_reg | sub_reg) &  (imm_shift == 5'b00000 && stype == 2'b11); 
    assign srval = (sbc_reg | sub_reg) & !(imm_shift == 5'b00000 && stype == 2'b11);
    // ====================================================================
    // ====================================================================
    
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - -     
                /* ---- sbc imm and sub imm ---- */
    
    always @( posedge en_inst & (sbc_imm | sub_imm))  begin
        if(Rn > {21'h0, imm_operand}) begin 
            res = sbc_imm ? Rn - {20'h0, imm_operand} - carry_in
                : Rn - {20'h0, imm_operand};
        end
        else if(Rn == {21'h0, imm_operand})begin 
            res = sbc_imm ? carry_in
                : 1'b0;
            res[31] = carry_in;
        end
        else if (Rn < {21'h0, imm_operand}) begin 
            res = sbc_imm ? {20'h0, imm_operand} - Rn - carry_in
                : {20'h0, imm_operand} - Rn;
            res[31] = 1'b1; 
        end
        c = res[31];
    end 

// - - - - - - - - - - - - - - - - - - - - - - - - - - - -     
                /* ---- sbc reg and sub reg ---- */
           
    always @( posedge en_inst & (sbc_reg | sub_reg) ) begin
        if(Rn > Rm) begin 
            res = sbc_reg ? Rn - Rm - carry_in
                : Rn - Rm;
        end
        else if(Rn == Rm)begin 
            res = sbc_reg ? carry_in
                : 1'b0;
            res[31] = carry_in;
        end
        else if (Rn < Rm) begin 
            res = sbc_reg ? Rm - Rn - carry_in
                : Rm - Rn;
            res[31] = 1'b1; 
        end
        c = res[31];

        if(rrext) 
        begin
            c = res[0];
            res = res >> 1;
        end
        
        if(srval) 
        begin
            if(!stype[1] & !stype[0]) // LSL
            begin
                {c,res} = res << imm_shift;
            end
            else if(!stype[1] & stype[0]) // LSR
            begin
                if(imm_shift == 5'h0)
                    c = 1'b0;
                else
                    c = res[imm_shift - 1];
                res = res >> imm_shift;
            end
            else if(!stype[1] & stype[0]) // ASR
            begin
                if(imm_shift == 5'h0)
                    c = 1'b0;
                else
                    c = res[imm_shift - 1];
                res = ({res[31], res[30:0] >> imm_shift});
            end
        end
    end    
    
    
    // ====================================================================
    // ====================================================================
                    /* ---- OUTPUT ---- */
    
    assign Rd  = res[31:0];
    
                   /* ---- Update flags if S == 1 ---- */
    assign carry_out  = (en_inst & S)?           c             : carry_in;
    assign zero_out   = (en_inst & S)? (res[31:0] == 32'h0000) :  zero_in;
    assign neg_out    = (en_inst & S)? (res[31]   == 1'b1    ) :   neg_in;
    
endmodule
