
module tim1_EGR(
    input wire rst,

    input wire ld_egr,

    input wire i_ug,
    input wire i_cc1g,
    output wire o_ug,
    output wire o_cc1g
    );

reg [1:0]TIMx_EGR;


assign o_ug   = TIMx_EGR[0];
assign o_cc1g = TIMx_EGR[1];

always @(posedge ld_egr or posedge rst) begin
    if (rst) begin
        TIMx_EGR <= 0;
    end
    else begin
        TIMx_EGR <= {i_cc1g, i_ug};
    end
end 

endmodule
