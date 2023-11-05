`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2023 04:50:19 PM
// Design Name: 
// Module Name: movLogicArithShift
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

`define OP_MOV_LAS   4'b1101 // Mov and Logical and Arithemetics Shifts

module movLogicArithShift(
    
    input wire clk,
    input wire rst,
    
    
    input wire en_inst,
    input wire S,
    input wire [31:0] Rm,
    input wire [7:0] operand2,
    input wire [1:0] stype, 
    
    input wire carry_in,
    input wire zero_in,
    input wire neg_in,
    
    output wire [31:0] Rd,
    
    output wire carry_out,
    output wire zero_out,
    output wire neg_out
    );
    
    wire ll;
    wire lr;
    wire ar;
    
    
    reg [33:0]res;
    reg [7:0] count;
    reg c;   
    
    
    initial begin
        res = 34'd0;
        count = 8'd0;
        c = 0;   
    end
    
    // ====================================================================
    // ====================================================================
                  /* ---- Define the Operation ---- */
    assign ll = !stype[1] & !stype[0] & en_inst;
    assign lr = !stype[1] &  stype[0] & en_inst;
    assign ar =  stype[1] & !stype[0] & en_inst;
    
    // ====================================================================
    // ====================================================================
    
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - -     
                /* ---- LOGIC SHIFT LEFT ---- */
    
    always @( posedge en_inst & ll)  begin
        res = {1'b0,Rm,1'b0};
        count = operand2;
        c = carry_in;
        
        while (count > 0) begin
            res = {res[32:1],1'b0,1'b0};
            c = c | res[33]; 
            count = count -1'b1;
        
        end
    end 

// - - - - - - - - - - - - - - - - - - - - - - - - - - - -     
/* ---- LOGIC SHIFT RIGHT and ARITHMETIC SHIFT RIGHT---- */
           
    always @( posedge en_inst & (lr | ar) ) begin
        res = {1'b0,Rm,1'b0};
        count = operand2;
        c = carry_in;
        
        while (count > 0) begin
            res = {1'b0, 1'b0,res[32:1]};
            c = c | res[0]; 
            count = count -1'b1;
        end
        if (ar) begin
            res[32] = Rm[31];  // Saves the sign of the varaible
        end 
    end    
    
// - - - - - - - - - - - - - - - - - - - - - - - - - - - -     
       /* ---- ARITHMETIC SHIFT RIGHT ---- */

    
    // ====================================================================
    // ====================================================================
                    /* ---- OUTPUT ---- */
    
    assign Rd  = res[32:1];
    
                   /* ---- Update flags if S == 1 ---- */
    assign carry_out  = (en_inst & S)?           c             : carry_in;
    assign zero_out   = (en_inst & S)? (res[32:1] == 32'h0000) :  zero_in;
    assign neg_out    = (en_inst & S)?         res[32]         :   neg_in;
    
endmodule
