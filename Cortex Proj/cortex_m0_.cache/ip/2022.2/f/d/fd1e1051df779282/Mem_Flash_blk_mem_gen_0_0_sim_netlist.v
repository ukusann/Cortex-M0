// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Mon Nov 13 00:53:49 2023
// Host        : marco-VivoBook-15-ASUS-Laptop-X507UBR running 64-bit Ubuntu 22.04.1 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Mem_Flash_blk_mem_gen_0_0_sim_netlist.v
// Design      : Mem_Flash_blk_mem_gen_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Mem_Flash_blk_mem_gen_0_0,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    rsta,
    ena,
    addra,
    douta,
    clkb,
    rstb,
    enb,
    addrb,
    doutb,
    rsta_busy,
    rstb_busy);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_WRITE_MODE READ_ONLY, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA RST" *) input rsta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [10:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_WRITE_MODE READ_ONLY, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB RST" *) input rstb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [10:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [31:0]doutb;
  output rsta_busy;
  output rstb_busy;

  wire [10:0]addra;
  wire [10:0]addrb;
  wire clka;
  wire [31:0]douta;
  wire [31:0]doutb;
  wire ena;
  wire enb;
  wire rsta;
  wire rsta_busy;
  wire rstb;
  wire rstb_busy;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [10:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [10:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "11" *) 
  (* C_ADDRB_WIDTH = "11" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "1" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "2" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     9.7422 mW" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "1" *) 
  (* C_HAS_RSTB = "1" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "NONE" *) 
  (* C_INIT_FILE_NAME = "Mem_Flash_blk_mem_gen_0_0.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "4" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1040" *) 
  (* C_READ_DEPTH_B = "1040" *) 
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
  (* C_WRITE_DEPTH_A = "1040" *) 
  (* C_WRITE_DEPTH_B = "1040" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[10:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(rsta),
        .rsta_busy(rsta_busy),
        .rstb(rstb),
        .rstb_busy(rstb_busy),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[10:0]),
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
        .wea(1'b0),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 52912)
`pragma protect data_block
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
14MLHuYKLhJnkw13fhGWaw==
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
