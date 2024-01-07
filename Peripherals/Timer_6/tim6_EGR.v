`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/21/2023 11:44:16 AM
// Design Name: 
// Module Name: tim6_EGR
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


module tim6_EGR(
    input wire rst,

    input wire ld_egr,

    input wire i_ug,

    output wire o_ug
    );

reg TIMx_EGR;


assign o_ug = TIMx_EGR;


always @(posedge ld_egr or posedge rst) begin
    if (rst) begin
        TIMx_EGR <= 0;
    end
    else begin
        TIMx_EGR <= i_ug;
    end
end 

endmodule
