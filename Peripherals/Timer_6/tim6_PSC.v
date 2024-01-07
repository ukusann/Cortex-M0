`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/21/2023 11:44:16 AM
// Design Name: 
// Module Name: tim6_ARR
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


module tim6_PSC(
    input wire rst,

    input wire ld_bpsc,

    input wire [15:0] i_bpsc,

    output wire [15:0] o_bpsc

    );

reg [15:0]TIMx_bpsc;


assign o_bpsc = TIMx_bpsc;


always @(posedge ld_bpsc or posedge rst) begin
    if (rst) begin
        TIMx_bpsc <= 0;
    end
    else begin
        TIMx_bpsc <= i_bpsc;
    end
end 



endmodule
