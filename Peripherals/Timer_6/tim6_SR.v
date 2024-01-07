`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/21/2023 11:44:16 AM
// Design Name: 
// Module Name: tim6_SR
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


module tim6_SR(
    input wire rst,

    input wire ld_sr,

    input wire i_uif,

    output wire o_uif
    );

reg TIMx_SR;


assign o_uif = TIMx_SR;


always @(posedge ld_sr or posedge rst) begin
    if (rst) begin
        TIMx_SR <= 0;
    end
    else begin
        TIMx_SR <= i_uif;
    end
end 

endmodule
