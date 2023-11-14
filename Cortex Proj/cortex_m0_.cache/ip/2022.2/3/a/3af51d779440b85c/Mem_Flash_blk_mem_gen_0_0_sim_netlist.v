// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Tue Nov 14 02:52:15 2023
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
ZqigS8WaM2xKfGXCXDjdOQ==
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
