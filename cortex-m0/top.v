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


module cortex_m0(
    input wire clk,
    input wire rst
    );

       
// ----------------------------------------------------------
 /* <<<<<<<<<<<<<<<<< Initializations >>>>>>>>>>>>>>>>>> */
 
    initial begin
    
    end
  
  
 // ----------------------------------------------------------
 // ----------------------------------------------------------
 /* <<<<<<<<<<<<<<<<<<<< CONTROL UNIT >>>>>>>>>>>>>>>>>>>>> */
    
    ControlUnit cu(
            clk, rst,
            update_flags,
            write_rd,
            ig_ex,
            br_en,
            cu_wr_mem,
            branch,
            new_pc_en,
            cu_decode,
            cu_execute,
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
            cu_wr_mem,
            branch,
            new_pc_en,
            cu_decode,
            cu_execute,
            ld_sp,
            ld_lr,
            ld_pc,
            ld_rd,
            ld_apsr,
            ld_ipsr,
            ild_primask,
            update_flags,
            write_rd,
            ig_ex,
            br_en
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


endmodule
