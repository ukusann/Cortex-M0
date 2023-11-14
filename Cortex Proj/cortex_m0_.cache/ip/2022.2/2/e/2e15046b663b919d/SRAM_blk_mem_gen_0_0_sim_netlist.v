// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Sun Nov 12 13:02:33 2023
// Host        : marco-VivoBook-15-ASUS-Laptop-X507UBR running 64-bit Ubuntu 22.04.1 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ SRAM_blk_mem_gen_0_0_sim_netlist.v
// Design      : SRAM_blk_mem_gen_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "SRAM_blk_mem_gen_0_0,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_5 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 22960)
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
