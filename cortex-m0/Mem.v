`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2023 05:12:54 PM
// Design Name: 
// Module Name: Mem
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


module Mem(
    input wire clk,
    input wire rst,
    
    input wire ld_flash,
    input wire [ 9:0] flash_addr_PC,
    
    output wire flash_busy,
    output wire [31:0] dout_flash
    );
    
    
    
   // ==================================================================
   // ==================================================================
                 /* ----- FLASH MEMORY REGION ----- */
    
    Mem_Flash Mem_Flash_i(
        flash_addr_PC,
        clk,
        dout_flash,
        flash_busy,
        ld_flash,
        rst
        );
   
   // ==================================================================
   // ==================================================================
                 /* ----- SRAM MEMORY REGION ----- */
     
     
     
   // ==================================================================
   // ==================================================================
                 /* ----- PERIPHERALS MEMORY REGION ----- */
    
    
    
    
endmodule
