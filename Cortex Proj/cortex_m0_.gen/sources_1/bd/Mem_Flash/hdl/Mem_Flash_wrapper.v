//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
//Date        : Tue Nov 14 09:07:00 2023
//Host        : marco-VivoBook-15-ASUS-Laptop-X507UBR running 64-bit Ubuntu 22.04.1 LTS
//Command     : generate_target Mem_Flash_wrapper.bd
//Design      : Mem_Flash_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module Mem_Flash_wrapper
   (A_addrss,
    B_addrss,
    busy_Afl,
    busy_Bfl,
    clk,
    dout_Afl,
    dout_Bfl,
    en_Afl,
    en_Bfl,
    rst);
  input [10:0]A_addrss;
  input [10:0]B_addrss;
  output busy_Afl;
  output busy_Bfl;
  input clk;
  output [31:0]dout_Afl;
  output [31:0]dout_Bfl;
  input en_Afl;
  input en_Bfl;
  input rst;

  wire [10:0]A_addrss;
  wire [10:0]B_addrss;
  wire busy_Afl;
  wire busy_Bfl;
  wire clk;
  wire [31:0]dout_Afl;
  wire [31:0]dout_Bfl;
  wire en_Afl;
  wire en_Bfl;
  wire rst;

  Mem_Flash Mem_Flash_i
       (.A_addrss(A_addrss),
        .B_addrss(B_addrss),
        .busy_Afl(busy_Afl),
        .busy_Bfl(busy_Bfl),
        .clk(clk),
        .dout_Afl(dout_Afl),
        .dout_Bfl(dout_Bfl),
        .en_Afl(en_Afl),
        .en_Bfl(en_Bfl),
        .rst(rst));
endmodule
