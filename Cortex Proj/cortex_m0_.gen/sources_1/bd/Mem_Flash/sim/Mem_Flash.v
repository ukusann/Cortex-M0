//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
//Date        : Tue Nov 14 09:06:59 2023
//Host        : marco-VivoBook-15-ASUS-Laptop-X507UBR running 64-bit Ubuntu 22.04.1 LTS
//Command     : generate_target Mem_Flash.bd
//Design      : Mem_Flash
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "Mem_Flash,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=Mem_Flash,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "Mem_Flash.hwdef" *) 
module Mem_Flash
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

  wire [10:0]A_addrss_1;
  wire [10:0]B_addrss_1;
  wire [31:0]blk_mem_gen_0_douta;
  wire [31:0]blk_mem_gen_0_doutb;
  wire blk_mem_gen_0_rsta_busy;
  wire blk_mem_gen_0_rstb_busy;
  wire ckl_1;
  wire en_Afl_1;
  wire en_Bfl_1;
  wire rst_1;

  assign A_addrss_1 = A_addrss[10:0];
  assign B_addrss_1 = B_addrss[10:0];
  assign busy_Afl = blk_mem_gen_0_rsta_busy;
  assign busy_Bfl = blk_mem_gen_0_rstb_busy;
  assign ckl_1 = clk;
  assign dout_Afl[31:0] = blk_mem_gen_0_douta;
  assign dout_Bfl[31:0] = blk_mem_gen_0_doutb;
  assign en_Afl_1 = en_Afl;
  assign en_Bfl_1 = en_Bfl;
  assign rst_1 = rst;
  Mem_Flash_blk_mem_gen_0_0 blk_mem_gen_0
       (.addra(A_addrss_1),
        .addrb(B_addrss_1),
        .clka(ckl_1),
        .clkb(ckl_1),
        .douta(blk_mem_gen_0_douta),
        .doutb(blk_mem_gen_0_doutb),
        .ena(en_Afl_1),
        .enb(en_Bfl_1),
        .rsta(rst_1),
        .rsta_busy(blk_mem_gen_0_rsta_busy),
        .rstb(rst_1),
        .rstb_busy(blk_mem_gen_0_rstb_busy));
endmodule
