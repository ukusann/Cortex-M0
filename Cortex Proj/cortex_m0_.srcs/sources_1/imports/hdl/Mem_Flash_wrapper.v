//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
//Date        : Sat Nov  4 22:15:17 2023
//Host        : marco-VivoBook-15-ASUS-Laptop-X507UBR running 64-bit Ubuntu 22.04.1 LTS
//Command     : generate_target Mem_Flash_wrapper.bd
//Design      : Mem_Flash_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module Mem_Flash_wrapper
   (addr_flash,
    ckl,
    dout_flash,
    flash_busy,
    ld_flash,
    rst);
  input [9:0]addr_flash;
  input ckl;
  output [31:0]dout_flash;
  output flash_busy;
  input ld_flash;
  input rst;

  wire [9:0]addr_flash;
  wire ckl;
  wire [31:0]dout_flash;
  wire flash_busy;
  wire ld_flash;
  wire rst;

  Mem_Flash Mem_Flash_i
       (.addr_flash(addr_flash),
        .ckl(ckl),
        .dout_flash(dout_flash),
        .flash_busy(flash_busy),
        .ld_flash(ld_flash),
        .rst(rst));
endmodule
