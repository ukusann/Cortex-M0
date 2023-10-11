`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2023 04:55:42 PM
// Design Name: 
// Module Name: top
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


module top();

    reg   clk, rst;
    reg  wr_en;
    
    // test
    reg [7:0]count;
        
// ----------------------------------------------------------
 /* <<<<<<<<<<<<<<<<< Initializations >>>>>>>>>>>>>>>>>> */
 
    initial begin
        clk <= 1'b0;
        rst <= 1'b0;
        wr_en <= 1'b0;
        
        // test
        count <= 8'd0;
    end
  
  
 // ----------------------------------------------------------
 // ----------------------------------------------------------
 /* <<<<<<<<<<<<<<<<<<<< CONTROL UNIT >>>>>>>>>>>>>>>>>>>>> */
    
    ControlUnit cu(
            clk, rst,
            ld_sp,
            ld_lr,
            ld_pc,
            ld_rd,
            ld_apsr,
            ld_ipsr,
            ild_primask
            );  
 // ----------------------------------------------------------
 // ----------------------------------------------------------
 /* <<<<<<<<<<<<<<<<<<<<<< DATAPATH >>>>>>>>>>>>>>>>>>>>>>> */
    
    Datapath dp(
            clk, rst, 
            wr_en,
            ld_sp,
            ld_lr,
            ld_pc,
            ld_rd,
            ld_apsr,
            ld_ipsr,
            ild_primask
            );
    
 // ----------------------------------------------------------
 // ----------------------------------------------------------
 /* <<<<<<<<<<<<<<<<< SIMULATION SIGNALS >>>>>>>>>>>>>>>>>> */

// ===================================================================
// Write Test
/*
    always @(posedge clk or posedge rst) begin
        
        if (rst)begin
             count <= 8'd0;
        end 
        else begin
            if (count == 8'd5) begin
                count <= 8'd0;
                wr_en <= 1'b1;
             end
            else begin
                wr_en <= 1'b0;
                count <= count + 1'b1;
            end
               
        end
    end 
*/


    // clock
    always #5 clk = ~clk;

endmodule
