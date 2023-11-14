// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Sun Nov 12 13:02:36 2023
// Host        : marco-VivoBook-15-ASUS-Laptop-X507UBR running 64-bit Ubuntu 22.04.1 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/marco/embeddedsys_23_24/cortex_m0_/cortex_m0_.gen/sources_1/bd/SRAM/ip/SRAM_blk_mem_gen_0_0/SRAM_blk_mem_gen_0_0_sim_netlist.v
// Design      : SRAM_blk_mem_gen_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "SRAM_blk_mem_gen_0_0,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module SRAM_blk_mem_gen_0_0
   (clka,
    rsta,
    ena,
    wea,
    addra,
    dina,
    douta,
    rsta_busy);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_WRITE_MODE READ_WRITE, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA RST" *) input rsta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [5:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;
  output rsta_busy;

  wire [5:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire ena;
  wire rsta;
  wire rsta_busy;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_doutb_UNCONNECTED;
  wire [5:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [5:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "6" *) 
  (* C_ADDRB_WIDTH = "6" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "1" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     3.53845 mW" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "1" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "NONE" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "64" *) 
  (* C_READ_DEPTH_B = "64" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "64" *) 
  (* C_WRITE_DEPTH_B = "64" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  SRAM_blk_mem_gen_0_0_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[31:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[5:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(rsta),
        .rsta_busy(rsta_busy),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[5:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VHPlDkoDlWlBfBMvPBmGYmaek3s9hXXhjF28kllYPnaNm3TSnzzpXHWHc8Ye9/2L2yiQfJ1hTWou
Ia/zeQ8h9/dtr6QB5YkyW4wlb/LbMgXb+DGIXPSllNl0IMsRQIcQDbcQm1bO/nlhb+2pjxiuaQrl
DbvxoDwPs7z3LunRxsg=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lmIhoX8hXuc7tNV1sXY1K2/gXL7Y7Hq73qQF7+x03UWWTRd3uhGmVQtOMVbhIW+66UkWUHiD26zL
fzqGor8bgSNGpSFyS11k4TwLQT4OfAMGO8C9Qmmh4+VENBnpS9TW+wHzCv8oUwht7xYtYRZvOvYK
F3fMppz2sBkUd1lciw98ZE/UmNkhqBuMfIYF43j45DEJ55PBhOZNg91Ls4v3qBHyBAaYPFFoMry3
d5Fw1PZyFQSEOSSpwgyds2aN0g6oIwl7zm0LJrM9VDAOxBUE50hk+oHr4jj8J8UhHQJnlEHm1Idm
rvxKygNKRvfSpa90NYxZJFYgqnrMYg+19+9aZA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VkyCjO2onoeZWEoYQ/4ue7X5mkHyTYVW9xjdoTsGS4GdP/Q64VaCZL/jr6R8DVDXPMnH7tRMrDpo
jpYBnyzSgOkfgqM+96ioC2fDyAaG4gYgGLmrBR6qK3/mxXwAZZX+GJ9R/eWXkc9h8xN+gsSSX6/M
jIQCgeT6q7PB4dWT6KY=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Iub91V+TnhVlZCSLu6iKmFjix71y6/l83OPTs8uewWvkE7WcqYxEKi9fonXEkzAtWzuKwEUqnOlN
VBsNJqPUdKcd22q523mrdt89mpdosWD+hvZdO7ELhJniY5u9h49FFkubpN2JiUTcIcKEYxVNlds4
wyvaYUqbPVH5v2ooJwDdimS4GVn9HerCOgPwfshvQDNlMTxLcYju4v8BHMc5Rub9Q/ihvpQU74v2
ouZ9XIwA+C6pBLwvaqS8jE7HXOokgqJilaX/W/t+KEgiFry/txRTMU9WMD7tCN7lcfjCydmS3Lq+
3u6Hsr0S8BwNjcaDpZDnBTygUJd4JSqREnk33w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
U46EWFmKmpZGaWfyL+dokyQtJtaOYsa7HCW/+fdtw9/yHKTWFpmqKBZngBj5rPkNhtTDDCJkqsYj
tUXg1j4tgIBaCQn9B0q/aG+B3gPLrudp9hLL25mVbsfiTzdekiV2hJMmhuMoavKKPJHC6zyW7kZi
80er82OQy8h+Df/fe6TRjH9xEt3/b80tRKUMbxkLfnnkAyyf1KfOhB6/uyI4mwXuQR+DsAbzybKR
YtXpOiW72tGrXTFlzcwbHamWZefqsilVpBw6V5dh33vYKGx50xwWpj76maAkpQrOpB7zufeldJe4
W1UOEN84AZdRTLkVSxamWo/wp8nP9fiGS/ItRw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qczgIJYpE/SzErzK7eWJBGcDFEzDLm8cKbwJbPXuM6YnJxx44W+E60R3war7K2QGFAkOoCDUtDC7
SghJGF32btaDLzeKm0tQ669sBtQmMIaBrlt7I9QBkNM8zN9GL92qxNC9o3UVWMOYy5BmH8nUPgcE
O6lRubeltlrTuDe7UJQ2nEPHcXjpUJJ8dxktyW+LovBy1OxW8g4GRAsmEJsoOEg0HuDdWcc4IshJ
PvwPJ7LblELAKsdkSt65y9VaklaEm7MlH4ImlgIa74TgRmutLUbWxM1QYhGE5rAzFhGU5i3RJOdx
L3N7GGGvLMW2z9NSHbIFX+/eNII9fNJ9nZbgLA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ti1NUgDv8YPk90APMwfu/mRr38QYwAxZfv0T6zQ89YS55t2EquEGVqrEafYX6rTydLOw8le1Oucv
f2oERpSSSTih/ScZneSZmuPE/Zh2BU1Ajv0j+/+0uEWXU+5lLPbDJjnapTmJXih1MYPf0SHpZZmE
BKj2IEBI9MPZlh6bxpa5BWJnyPdAvHf+UNaMXU9+pmbtrzUVebql4mFJu45Z3+ehmFY4FBW3zXMF
44C4TlHACLwL3vHVMCVfeKhgdVDbpE+/IFhTStz7mZ9h9RKGanQcs6YDVM1R+2RKA1QT1fX4FiQc
1V+FGmrm1ujxmFGXwpfNKByVlfCY0oWhRJCYYQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
HuEXFK0NXt09xU2yxxjng1OLsT+ZEM4EhqBgpr9D2ljw2vDaMBrqEsRQTc2B9soDq3ewDduHJXBd
OGYxkPnoN6LhjULtB2nTgjcH6NxA4puZ1ZNcndDndVBo8rTW5W1OqHq6InAG0CqPpTIkuqz3ECPl
EysI++MCDfH6tIzlekxJFIJ1McJsTq5rFuLzMMcrmkBxgcayDpOcCFuzZzCczxmt/cCCIKmDybwT
OQXmOcLJoYLP4sFu6R9c6xO8i6p++crv2N3eIxZHKbek9xBBZqQM9EYuEtsbkqAs9XZpa16i5njR
BDFxTKcP6r7JgFALJE89AZhBbate5JXWp0v4ECZD18aEL17CipwcWPutNMdG1apzSPP5y59n7rMG
yxBPz1gKHc3Emkl4WcO0hjICxqmO6dMXoY8JvBSf6ry2l0sH9Ihr3Bq5WWmlhPHnoaNr5jl//vNe
KfToWtn97eoVSt1LnmXXnSpdigbHr0UIg8AdkpdkuNRaWdVicDdgSo49

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mokwst2bn6UxD6V9UdIgCIG1QQ/d0FiJqYGOTI2eHPV6YElaLjnJ8DnQmZnGS95o3x93FDOoa58C
RwYsX1fVoVtXkj1LuZq0k7q9vEe4T8xMjpkeYtIHY9k0Xhy1Lq/xRlfzGAf9fvf9e+f4r7aR/Sb/
uCZxxugG5niTwLENY1n3NthYL0jvo8Fmdw4Qg0nTCGWlVCws+09K0g9/lx6I9EcuHHemcHO3fOZG
lMc4NaPNozKwnyDMoWUkwiVxyFEPFaQLNYqzjvR+CqrWfhFLo96JWhL+eaDoNuZoBVYQtNH5ZwBL
BoO27Pw10lgcReGlZBz3BLO7T4ddynCx0+eSnw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PiP7AjOQqqouyQMoBQqgWIDhUSViq94rIvGiIJ/UKMDspM/yXw1caE8AhWHTjYckC4yLpPAz5P6s
1Z6flzDPrzVwg4e59X2cc4IMCHhedna0rDO804njcc6amRDTeLsMLTkWfvomB4xwszm2AgT+PRnB
WHd09ZUDVFjiBXT+Oa9AicgGJHrX3w823yBPuAa704kje/SzgtiDpcTU1eLmLhLW7LpEd9KIHd9s
ER7Uk9Orws0Kq9PMTqMX4hMn5K5mFakOeOURiEbUjdv5RiIJ2g/PlQXSItM8fHsBTQa6fOaJwQTI
vHwK3a8ZBHpfT1YH+n7wNiNUZwD4SFXm1QVx4g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ul5ZfTHJwMctaNhYRortUZizYMPYRef7uYqPSuMkxsArnxI/cjGh+KRMwzV86hyp/6TXSJIjm5ec
2wX2UONdPN+DOJ84jYC4JbgJQrPnTj7ioD8uLX/WlyPcQzyF5keqFgj5eR5s13FskVWCuAWf5m9w
mhFEKFjVXDAr7gVgAJh/hL8P6Psrnf+LGfiM8JhnDepsHEYykGlpD3fzru2BGgqHWqPqFMcnyVGl
vysaIXiJz/eYKvO8RGcgd3DJAM/wPm9A0m/DWcmSnczOgTjoqkHcBg2H5uJMLvufzmjImi6LYEqq
v04ESDEN31cSUzqUYcayvMFOnI/WNsWbFIa5+Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 23024)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
