`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2023 04:10:04 PM
// Design Name: 
// Module Name: Datapath
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


module Datapath(
    input wire clk,
    input wire rst,
    input wire wr_en
    );
  
  
    reg [31:0] base_addr;
    reg [31:0] w_data;
        
    wire [31:0] r_data;
    
    // test
    reg [7:0]  c;
  
    initial begin
        base_addr <= 32'h00000004;
        w_data    <= 32'h2010fcfb;
        
        // test
        c <= 0;
    end
      
    
    
    Memory mem(
               clk,rst, 
               wr_en,   
               base_addr, 
               w_data, 
               r_data );
               
 //================================================================
 // Write memory Test
  /*             
     always @(negedge wr_en or posedge rst) begin
        
        if (rst)begin
            w_data <= 32'h00000004;        
        end 
        else if (!wr_en) begin
            w_data <= w_data + 32'h00000005;
        
        end
    end 
    */
    
 //================================================================
 // Read memory Test   
  /*  
    always @(posedge clk or posedge rst) begin
        
        if (rst)begin
            w_data <= 32'h00000004;        
        end 
        else if (c == 8'd5) begin
            base_addr <= 32'd250;
        end
        else begin
            c <= c+1;
        end
    end*/
endmodule
