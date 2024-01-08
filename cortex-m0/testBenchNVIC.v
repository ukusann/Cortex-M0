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

`define SIM_TIME 8'd255

module testBench();
    
    reg   clk, rst;
    
    reg [7:0]count;
 
    wire [31:0] ISER;     // ISER: Interrupt Set-Enable Register
    wire [31:0] ICER;     // ICER: Interrupt Clear-Enable Register
    wire [31:0] ISPR;    // ISPR: Interrupt Set-Pending Register
    wire [31:0] ICPR;    // ICPR: Interrupt Clear-Pending Register
    wire [32:0] IPR [7:0]; // IPR0-IPR7: Interrupt Priority Registers
    wire [7:0] interrupt_active;  
    
    assign ISER = 32'h80;
    assign ICER = 32'h0;
    assign ISPR = 32'h80;
    assign ICPR = (count+1%4) ? 32'h80 : 32'h00;
    assign IPR[0] = 32'h00; 
    assign IPR[1] = 32'hc000;
    assign IPR[2] = 32'h00;
    assign IPR[3] = 32'h00;
    assign IPR[4] = 32'h00;
    assign IPR[5] = 32'h00;
    assign IPR[6] = 32'h00;
    assign IPR[7] = 32'h00;

    initial begin
        clk = 1'b0;
        rst = 1'b0;


        count <= 8'd1;
    end
    

    
    
    
    NVIC NVIC(
        clk,
        rst,
        ISER,
        ICER,
        ISPR,
        ICPR,
        IPR[0],
        IPR[1],
        IPR[2],
        IPR[3],
        IPR[4],
        IPR[5],
        IPR[6],
        IPR[7],
        interrupt_active
        
    ); 
 
 
 
 
 
       // clock
    always #62 clk = ~clk;



// ================================================================
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
           count <= 8'h00;
        end
        
    end 



endmodule
