// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Tue Nov 14 00:34:31 2023
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
uDTtK+VBHjH+GH7DsWGn0w==
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
