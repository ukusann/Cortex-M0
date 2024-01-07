`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/21/2023 11:44:16 AM
// Design Name: 
// Module Name: tim6_CNT
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tim6_CNT(
    input wire clk,
    input wire rst,

    input wire ld_cnt,
    input wire [15:0] tim6_arr,
    input wire [15:0] i_data_cnt,
    
    output wire [15:0] o_tim6_cnt,
    output wire cnt_ov
    );

reg [15:0] tim6_bCNT;

// Timer 6 Overflow Condition:
assign cnt_ov = tim6_arr == tim6_bCNT;

// Timer 6 Counter UP: 
assign o_tim6_cnt = (tim6_bCNT +1) & {16{ !cnt_ov }}; 

always @ (posedge clk or posedge rst) begin
    if (rst) begin
        tim6_bCNT <= 16'hffff;
    end
    else begin
        tim6_bCNT <= (o_tim6_cnt & {16{ !ld_cnt }}) | (i_data_cnt & {16{ ld_cnt }}); 
    end

end

endmodule

