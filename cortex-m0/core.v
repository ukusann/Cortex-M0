`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2023 05:03:40 PM
// Design Name: 
// Module Name: core
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


module core(
    input wire clk,
    input wire rst,
    
    input wire flash_busy,
    input wire [31:0] dout_flash,
    
    output wire ld_flash,
    output wire [ 9:0] flash_addr_PC
    
    );
    
      
 // ----------------------------------------------------------
 // ----------------------------------------------------------
 /* <<<<<<<<<<<<<<<<<<<< CONTROL UNIT >>>>>>>>>>>>>>>>>>>>> */
    
    ControlUnit cu(
            clk, rst,
            flash_busy,
            update_flags,
            write_rd,
            ig_ex,
            br_en,
            br_L,
            ld_flash,
            cu_wr_mem,
            branch,
            cu_execute,
            ld_sp,
            ld_lr,
            ld_pc,
            ld_ir,
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
            cu_execute,
            ld_sp,
            ld_lr,
            ld_pc,
            ld_ir,
            ld_rd,
            ld_apsr,
            ld_ipsr,
            ild_primask,
            dout_flash,
            flash_addr_PC,
            update_flags,
            write_rd,
            ig_ex,
            br_en,
            br_L
            );
    
endmodule
