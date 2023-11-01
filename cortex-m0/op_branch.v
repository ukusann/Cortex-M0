`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2023 09:01:57 AM
// Design Name: 
// Module Name: op_branch
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


module op_branch(
        input wire inst_brach,
        input wire Link,
        
        input wire [31:0] offset,
        input wire [31:0] in_PC,
        
        output wire [31:0] out_PC,
        output wire [31:0] LR
    );
    
    reg [31:0] pc;
    reg [31:0] lr;
    reg wr_pc;
    reg wr_lr;
    
    initial begin
        pc = 32'd0;
        lr = 32'd0;
        wr_pc = 0;
        wr_lr = 0;
    end
    
    always @(posedge inst_brach) begin
        wr_pc = 0;
        wr_lr = 0;
        pc =  in_PC + offset;
        if (Link) begin
            lr = in_PC;
            wr_lr = 1;    
        end
        wr_pc = 1;
    end
    
    assign out_PC = pc;
    assign LR = lr; 
    
    /*
    assign out_PC = (inst_brach)? in_PC + offset: 32'd0;
    assign LR = (Link & inst_brach)? in_PC : 0; 
    */
    
    
endmodule
