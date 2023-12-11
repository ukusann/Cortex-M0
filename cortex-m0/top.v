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


module stm32F072(
    input wire clock,
    input wire rst,
    output wire [3:0] r3
    );


wire flash_busy, ld_flash, ld_mem, men_wr;
wire busy_flA,busy_flB,busy_sram;

wire [31:0] dout_flash_code;
wire [31:0] din_mem;
wire [31:0] dout_mem;

wire [ 9:0] flash_addr_PC;
wire [31:0] addr_mem;


 // ----------------------------------------------------------
 // ----------------------------------------------------------
 /* <<<<<<<<<<<<<<<<<<< Core Cortex-M0 >>>>>>>>>>>>>>>>>>>> */

    core corterx_m0(
        clock,
        rst,
        busy_flA,
        busy_flB,
        busy_sram,
        dout_flash_code,
        dout_mem,
        
        din_mem,
        ld_flash,
        ld_mem,
        mem_wr,
        flash_addr_PC,
        addr_mem,
        
        r3
    );       


 // ----------------------------------------------------------
 // ----------------------------------------------------------
 /* <<<<<<<<<<<<<<<<<<<<<<<< Memory >>>>>>>>>>>>>>>>>>>>>>> */
    Mem Memory(
        clock, rst,
    
        ld_flash,
        ld_mem,
        mem_wr,
        
        flash_addr_PC,
        addr_mem[10:0],
        din_mem,
        
        busy_flA,
        busy_flB,
        busy_sram,
        
        dout_flash_code,
        dout_mem
    );
    
    
endmodule
