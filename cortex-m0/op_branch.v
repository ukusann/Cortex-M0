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
        input wire clk,
        input wire rst,
        input wire inst_brach,
        input wire Link,
        
        input wire [31:0] offset,
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
    
    always @(negedge (clk & inst_brach) or posedge rst) begin
        
        if (rst) begin
            pc <= 32'd0;
            lr <= 32'd0;
        end else begin
            if (offset[23]) begin
                pc <=  in_PC - ( (offset[23:0] ^ 24'hFFFFFF) + 32'd1);
            end
            else begin
                pc <=  in_PC + offset;
            end
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
