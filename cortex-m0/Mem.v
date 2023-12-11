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

`define FLSH_V_BASE 11'h400
`define SRAM_V_BASE 11'h410
`define UART_P_BASE 11'h450
`define TIM1_P_BASE 11'h459
`define TIM6_P_BASE 11'h469
`define GPIO_P_BASE 11'h470

`define MEMORY_SIZE 11'h480


module Mem(
    input wire clk,
    input wire rst,
    
    input wire ld_flashA,
    input wire ld_mem,
    input wire w_mem,
    
    input wire [ 9:0] addr_flashA,
    input wire [10:0] addr_mem,
    input wire [31:0] din_mem,
    
    
    output wire busy_Afl,
    output wire busy_Bfl,
    output wire busy_sram,
    
    output wire [31:0] dout_flashA,
    output wire [31:0] dout_mem 
    );
    
        
    
    wire val_const;
    wire val_sram;
    wire gpio_phe;
    wire uart_phe;
    wire tim1_phe;
    wire tim6_phe;
    
    wire ld_flashB;
    
// _________________________________________________________________________
// =========================================================================
                    /* ---- Assign Regions ---- */
    assign val_const = (addr_mem >= `FLSH_V_BASE ) & (addr_mem < `SRAM_V_BASE ) & !w_mem;
    assign val_sram  = (addr_mem >= `SRAM_V_BASE ) & (addr_mem < `UART_P_BASE );
    assign uart_phe  = (addr_mem >= `UART_P_BASE ) & (addr_mem < `TIM1_P_BASE );
    assign tim1_phe  = (addr_mem >= `TIM1_P_BASE ) & (addr_mem < `TIM6_P_BASE );
    assign tim6_phe  = (addr_mem >= `TIM6_P_BASE ) & (addr_mem < `GPIO_P_BASE );
    assign gpio_phe  = (addr_mem >= `GPIO_P_BASE ) & (addr_mem < `MEMORY_SIZE );
    
    
    assign ld_flashB = ld_mem & val_const;
    
    
   // ==================================================================
   // ==================================================================
                 /* ----- FLASH MEMORY REGION ----- */
    wire [31:0] dout_Bfl;
    Mem_Flash Mem_Flash_i(
        .A_addrss( {1'b0, addr_flashA} ),
        .B_addrss(   addr_mem  ),
        
        .busy_Afl( busy_Afl ),
        .busy_Bfl( busy_Bfl ),
        
        .clk(clk),
        
        .dout_Afl ( dout_flashA ),
        .dout_Bfl ( dout_Bfl ),
        
        .en_Afl( ld_flashA ),
        .en_Bfl( val_const  & ld_mem ),
        
        .rst(rst)
        );
   
   // ==================================================================
   // ==================================================================
                 /* ----- SRAM MEMORY REGION ----- */
         wire [31:0] dout_sram;
         wire [11:0] sram_addr;
         
         assign sram_addr = (addr_mem - `SRAM_V_BASE) & 10'h3f;
         
    SRAM SRAM_i(
        .clk(clk),
        
        .din_sram(din_mem),
        .dout_sram(dout_sram),
        
        .en_sram(val_sram  & ld_mem ),
        
        .rst(rst),
        
        .sram_addr( sram_addr[5:0]),
        
        .sram_busy(busy_sram),
        
        .wea(w_mem)
    );
        
     
   // ==================================================================
   // ==================================================================
                 /* ----- PERIPHERALS MEMORY REGION ----- */
    
 
   
   // ==================================================================
   // ==================================================================
                    /* ---- Assign Outputs ---- */
    
    assign dout_mem = ( val_const )? dout_Bfl  :
                      (  val_sram & !w_mem )? dout_sram :
                      32'd0;  
    
    
endmodule
