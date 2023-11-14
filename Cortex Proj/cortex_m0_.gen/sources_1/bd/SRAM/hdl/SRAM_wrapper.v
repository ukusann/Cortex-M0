//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
//Date        : Sun Nov 12 12:05:37 2023
//Host        : marco-VivoBook-15-ASUS-Laptop-X507UBR running 64-bit Ubuntu 22.04.1 LTS
//Command     : generate_target SRAM_wrapper.bd
//Design      : SRAM_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module SRAM_wrapper
   (clk,
    din_sram,
    dout_sram,
    en_sram,
    rst,
    sram_addr,
    sram_busy,
    wea);
  input clk;
  input [31:0]din_sram;
  output [31:0]dout_sram;
  input en_sram;
  input rst;
  input [5:0]sram_addr;
  output sram_busy;
  input wea;

  wire clk;
  wire [31:0]din_sram;
  wire [31:0]dout_sram;
  wire en_sram;
  wire rst;
  wire [5:0]sram_addr;
  wire sram_busy;
  wire wea;

  SRAM SRAM_i
       (.clk(clk),
        .din_sram(din_sram),
        .dout_sram(dout_sram),
        .en_sram(en_sram),
        .rst(rst),
        .sram_addr(sram_addr),
        .sram_busy(sram_busy),
        .wea(wea));
endmodule
