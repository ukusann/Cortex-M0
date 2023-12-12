`timescale 1ns / 1ps

`include "Defines.v"

module op_mov(
    
    input wire clk,
    input wire rst,
    
    
    input wire en_inst,
    input wire IMM, 
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
    
    
    wire rrext; // rotate right with extend
    wire srval; // shift or rotate by value

    reg [32:0]res;
    reg c; 
    
    initial begin
        res <= 32'd0;
        c <= 1'b0;
    end
    
    // ====================================================================
    // ====================================================================
                  /* ---- Define the Operation ---- */
    assign rrext = (imm_shift == 5'b00000 && stype == 2'b11); 
    assign srval = !(imm_shift == 5'b00000 && stype == 2'b11);
    // ====================================================================
    // ====================================================================
    
// - - - - - - - - - - - - - - - - - - - - - - - - - - - -  

`include "Defines.v"

   
                /* ---- MOV  ---- */
           
    always @( negedge (clk & en_inst) or posedge rst  ) begin
    
        if (rst) begin
            res <= 32'd0;
            c <= 1'b0;
        end else begin
        
    
            if (IMM) begin
                res = {20'h0, imm_operand};
            end
            else if (!IMM) begin
                res = Rm;
        
                if(rrext) 
                begin
                    c = res[0];
                    res = res >> 1;
                end
                
                if(srval) 
                begin
                    if(!stype[1] & !stype[0]) // LSL
                    begin
                        c = res[31];
                        res <= res << imm_shift;
                    end
                    else if(!stype[1] & stype[0]) // LSR
                    begin
                        if(imm_shift == 5'h0)
                            c = 1'b0;
                        else
                            c = res[imm_shift - 1];
                        res = (res >> imm_shift);
                    end
                    else if(!stype[1] & stype[0]) // ASR
                    begin
                        if(imm_shift == 5'h0)
                            c = 1'b0;
                        else
                            c = res[imm_shift - 1];
                        res = ({res[31:0] >> imm_shift});
                    end
                end
            end
        end
    end    
    

    
    // ====================================================================
    // ====================================================================
                    /* ---- OUTPUT ---- */
    
    assign Rd  = res;
    
                   /* ---- Update flags if S == 1 ---- */
    assign carry_out  = (S)?           c          : carry_in;
    assign zero_out   = (S)? (res[31:0] == 32'h0) :  zero_in;
    assign neg_out    = (S)? (res[31]   == 1'b1 ) :   neg_in;
    
endmodule
