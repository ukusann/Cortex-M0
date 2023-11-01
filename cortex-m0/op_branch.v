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
    
    assign out_PC = (inst_brach)? in_PC + offset: 32'd0;
    assign LR = (Link & inst_brach)? in_PC : 0; 
    
    
    
endmodule
