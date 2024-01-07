`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/21/2023 11:44:16 AM
// Design Name: 
// Module Name: tim6_DIER
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


module tim6_DIER(
    input wire rst,

    input wire ld_dier,

    input wire i_uie,

    output wire o_uie
    );

reg TIMx_DIER;


assign o_uie = TIMx_DIER;


always @(posedge ld_dier or posedge rst) begin
    if (rst) begin
        TIMx_DIER <= 0;
    end
    else begin
        TIMx_DIER <= i_uie;
    end
end 

endmodule
