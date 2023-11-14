//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
//Date        : Sun Nov 12 12:05:36 2023
//Host        : marco-VivoBook-15-ASUS-Laptop-X507UBR running 64-bit Ubuntu 22.04.1 LTS
//Command     : generate_target SRAM.bd
//Design      : SRAM
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "SRAM,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=SRAM,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "SRAM.hwdef" *) 
module SRAM
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

  wire [31:0]blk_mem_gen_0_douta;
  wire blk_mem_gen_0_rsta_busy;
  wire clk_1;
  wire [31:0]din_sram_1;
  wire en_sram_1;
  wire rst_1;
  wire [5:0]sram_addr_1;
  wire wea_1;

  assign clk_1 = clk;
  assign din_sram_1 = din_sram[31:0];
  assign dout_sram[31:0] = blk_mem_gen_0_douta;
  assign en_sram_1 = en_sram;
  assign rst_1 = rst;
  assign sram_addr_1 = sram_addr[5:0];
  assign sram_busy = blk_mem_gen_0_rsta_busy;
  assign wea_1 = wea;
  SRAM_blk_mem_gen_0_0 blk_mem_gen_0
       (.addra(sram_addr_1),
        .clka(clk_1),
        .dina(din_sram_1),
        .douta(blk_mem_gen_0_douta),
        .ena(en_sram_1),
        .rsta(rst_1),
        .rsta_busy(blk_mem_gen_0_rsta_busy),
        .wea(wea_1));
endmodule
