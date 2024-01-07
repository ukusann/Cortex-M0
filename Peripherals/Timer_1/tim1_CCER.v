
module tim1_CCER(
    input wire rst,
    input wire ld_ccer,
    input wire [3:0] i_ccer,

    output wire  o_cc1E,
    output wire  o_cc1P,
    output wire  o_cc1NE,
    output wire  o_cc1NP
);

reg [3:0] TIMx_CCER;

assign o_cc1E  = TIMx_CCER[0];
assign o_cc1P  = TIMx_CCER[1];
assign o_cc1NE = TIMx_CCER[2];
assign o_cc1NP = TIMx_CCER[3];


always @(posedge ld_ccer or posedge rst) begin
    if (rst) begin
        TIMx_CCER <= 0;
    end
    else begin
        TIMx_CCER <= i_ccer;
    end
end 

endmodule