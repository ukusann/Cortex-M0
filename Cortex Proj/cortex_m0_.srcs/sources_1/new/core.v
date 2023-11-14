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
    
    input wire busy_flA,
    input wire busy_flB,
    input wire busy_sram,
    input wire [31:0] dout_flash,
    input wire [31:0] dout_mem, // Output data Memory (Read/Load) 
    
    output wire [31:0] din_mem,  // Input data Memory (Write/Store)
    output wire ld_flash,
    output wire ld_mem,
    output wire mem_wr,
    output wire [ 9:0] flash_addr_PC,
    output wire [31:0] addr_mem, 
    
    output wire [3:0] r3
    
    );
    
      
 // ----------------------------------------------------------
 // ----------------------------------------------------------
 /* <<<<<<<<<<<<<<<<<<<< CONTROL UNIT >>>>>>>>>>>>>>>>>>>>> */
    
    ControlUnit cu(
            clk, rst,
            busy_flA,
            busy_flB,
            busy_sram,
            update_flags,
            write_rd,
            write_rn,
            mem_en,
            ig_ex,
            br_en,
            br_L,
            ld_flash,
            branch,
            cu_execute,
            ld_sp,
            ld_lr,
            ld_pc,
            ld_ir,
            ld_mem,
            ld_rd,
            ld_rn,
            ld_apsr,
            ld_ipsr,
            ld_primask
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
            ld_rn,
            ld_apsr,
            ld_ipsr,
            ld_primask,
            dout_flash,
            dout_mem, 
            din_mem, 
            flash_addr_PC,
            addr_mem, 
            update_flags,
            write_rd,
            write_rn,
            mem_en,
            mem_wr,
            ig_ex,
            br_en,
            br_L,
            r3
            );
    
endmodule
