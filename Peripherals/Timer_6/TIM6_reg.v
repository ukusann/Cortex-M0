`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2023 09:07:58 PM
// Design Name: 
// Module Name: TIM6_reg
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

`define SIZE_TIM6_REG 8'h7

`define TIM6_CR1  4'h0
`define TIM6_DIER 4'h1
`define TIM6_SR   4'h2
`define TIM6_EGR  4'h3
`define TIM6_CNT  4'h4
`define TIM6_PSC  4'h5
`define TIM6_ARR  4'h6
`define TIM6_NONE 4'h7


module TIM6_reg(
    input wire clk,
    input wire TIM6_clk_cnt,
    input wire rst,
    
    input wire [ 3:0] ld_tim6_reg,
    input wire [31:0] data_reg,
    
    input wire i_UEV,
    input wire rst_uif,
    
    output wire [4:0] tim6_cr1, // Control Signals
    output wire tim6_uie,       // Interrupt Update Event Enable/Disable
    output wire tim6_uif,       // Interrupt Update Event Flag
    output wire tim6_ug,        // Software Force Update Event  
    
    // Output Buffers     
    output wire [15:0] tim6_bCNT, // Counter
    output wire [15:0] tim6_bPSC, // Prescaler
    output wire [15:0] tim6_bARR, // AutoReload
    output wire tim6_bCNT_OV      // Counter Overflow
    );

// _______________________________________________________________
// ***************************************************************

// ===============================================================
            /* <<<< TIMER 6 REGISTERS >>>> */
 
// _______________________________________________________________
// ***************************************************************

// ===============================================================
         /* <<<< TIMER 6 LOAD AND RESETS REGISTERS >>>> */    

// ......................................
// LOAD Registers Condition:
wire tim6_ld_cr1;
wire tim6_ld_dier;
wire tim6_ld_sr;
wire tim6_ld_egr;
wire tim6_ld_psc;
wire tim6_ld_arr;

assign tim6_ld_cr1  = ld_tim6_reg == `TIM6_CR1;
assign tim6_ld_dier = ld_tim6_reg == `TIM6_DIER;
assign tim6_ld_sr   = ld_tim6_reg == `TIM6_SR;
assign tim6_ld_egr  = ld_tim6_reg == `TIM6_EGR;
assign tim6_ld_psc  = ld_tim6_reg == `TIM6_PSC;
assign tim6_ld_arr  = ld_tim6_reg == `TIM6_ARR;

// ......................................
// RESET Registers Conditions:

wire rst_sr;
wire rst_egr;

assign  rst_sr  = rst | rst_uif;
assign  rst_egr = (ld_tim6_reg != `TIM6_EGR) | rst;

// _______________________________________________________________
// ***************************************************************

// ===============================================================
           /* <<<< TIMER 6  REGISTERS >>>> */    

// ......................................
// Register TIM6_CR1

wire tim6_CEN;
wire tim6_UDIS;
wire tim6_URS;
wire tim6_OPM;
wire tim6_ARPE;

tim6_CR1 TIM6_CR1(
    .rst(rst),
    .ld_cr1(tim6_ld_cr1),
    .i_tim6_cr1({data_reg[7], data_reg[3:0]}),
    .o_tim6_cr1({
        tim6_ARPE,
        tim6_OPM,
        tim6_URS,
        tim6_UDIS,
        tim6_CEN
    })
);


// ......................................
// Register TIM6_DIER
tim6_DIER TIM6_DIER(
    .rst(rst),
    .ld_sr(tim6_ld_dier),
    .i_uie(data_reg[0]),
    .o_uie(tim6_uie)
);

// ......................................
// Register TIM6_SR
tim6_SR TIM6_SR(
    .rst(rst_sr),
    .ld_sr(tim6_ld_sr),
    .i_uif(data_reg[0]),
    .o_uif(tim6_uif)
);

// ......................................
// Register TIM6_EGR
tim6_EGR TIM6_EGR(
    .rst(rst_egr),
    .ld_egr(tim6_ld_egr),
    .i_ug(data_reg[0]),
    .o_ug(tim6_ug)
);

// ......................................
// Buffer Prescaler
tim6_REGbuffer_16 TIM6_PSC(
    .rst(rst),
    .ld_breg(tim6_ld_psc),
    .i_breg(data_reg[15:0]),
    .o_breg(tim6_bPSC)
);

// ......................................
// Buffer Auto Reload
tim6_REGbuffer_16 TIM6_ARR(
    .rst(rst),
    .ld_breg(tim6_ld_arr),
    .i_breg(data_reg[15:0]),
    .o_breg(tim6_bARR)
);



endmodule
