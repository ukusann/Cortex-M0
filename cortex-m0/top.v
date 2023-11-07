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
    input wire clk,
    input wire rst
    );


wire flash_busy, ld_flash;
wire [31:0] dout_flash;
wire [ 9:0] flash_addr_PC;

 // ----------------------------------------------------------
 // ----------------------------------------------------------
 /* <<<<<<<<<<<<<<<<<<< Core Cortex-M0 >>>>>>>>>>>>>>>>>>>> */

    core corterx_m0(
        clk,
        rst,
        flash_busy,
        dout_flash,
    
        ld_flash,
        flash_addr_PC
    );       


 // ----------------------------------------------------------
 // ----------------------------------------------------------
 /* <<<<<<<<<<<<<<<<<<<<<<<< Memory >>>>>>>>>>>>>>>>>>>>>>> */
    Mem Memory(
        clk, rst,
    
        ld_flash,
        flash_addr_PC,
        
        flash_busy,
        dout_flash
    );

endmodule
