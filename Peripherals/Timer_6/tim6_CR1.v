`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/21/2023 11:44:16 AM
// Design Name: 
// Module Name: tim6_CR1
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


module tim6_CR1(
    input wire rst,

    input wire ld_cr1,

    input wire i_tim6_CEN,
    input wire i_tim6_UDIS,
    input wire i_tim6_URS,
    input wire i_tim6_OPM,
    input wire i_tim6_ARPE,

    output wire [4:0] o_tim6_cr1
    );

reg [4:0] TIMx_CR1;


assign o_tim6_cr1 = TIMx_CR1;


always @(posedge ld_cr1 or posedge rst) begin
    if (rst) begin
        TIMx_CR1 <= 0;
    end
    else begin
        TIMx_CR1 <= {
            i_tim6_ARPE,
            i_tim6_OPM,
            i_tim6_URS,
            i_tim6_UDIS,
            i_tim6_CEN
        };
    end
end 

endmodule
