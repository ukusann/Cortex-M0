// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Mon Nov 13 20:37:31 2023
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
x41MEfCr/zWaC/jOCSZ+sA==
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
