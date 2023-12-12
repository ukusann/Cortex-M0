`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2023 05:39:57 PM
// Design Name: 
// Module Name: op_branch_reg
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


module op_branch_reg(
    
    input wire clk,
    input wire rst,
    input wire inst_brach_reg,
    input wire Link,
    
    input wire [31:0] REG,
    input wire [31:0] in_PC,
    
    output wire [31:0] out_PC,
    output wire [31:0] LR
    );
    
    reg [31:0] pc;
    reg [31:0] lr;
    
    initial begin
        pc = 32'd0;
        lr = 32'd0;
    end
    
    always @(posedge ( clk & inst_brach_reg) or posedge rst) begin
        
        if (rst) begin
            pc <= 32'd0;
            lr <= 32'd0;
        end else begin
        
            pc <=  REG;
            
            if (Link) begin
                lr <= in_PC + 32'd1;
            end
            else begin
                lr <= 32'd0;
            end
        end
    end
    
    assign out_PC = pc;
    assign LR = lr; 

endmodule
