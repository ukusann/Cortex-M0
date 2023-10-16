`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2023 02:51:27 PM
// Design Name: 
// Module Name: testBench
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


module testBench();
    
    reg   clk, rst;
     // test
    reg [7:0]count;
 
 
     initial begin
        clk <= 1'b0;
        rst <= 1'b0;
        
        // test
        count <= 8'd0;
    end
    
    cortex_m0 top(
        clk, rst
    ); 
 
       // clock
    always #5 clk = ~clk;
endmodule
