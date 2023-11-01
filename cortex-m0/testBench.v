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

`define SIM_TIME 8'd30

module testBench();
    
    reg   clk, rst;
     // test
    reg [7:0]count;
 
 
     initial begin
        clk = 1'b0;
        rst = 1'b0;
        
        // test
        count <= 8'd0;
    end
    
    cortex_m0 top(
        clk, rst
    ); 
 
       // clock
    always #5 clk = ~clk;



//================================================================
// SIMULATION COUNTER
    
    always @(posedge clk or posedge rst) begin
        
        if (rst)begin
            count <= 8'h00;        
        end 
        else if(count < `SIM_TIME) begin
            count <= count + 8'h01;
        end 
        else begin
            $finish;
        end
        
    end 



endmodule
