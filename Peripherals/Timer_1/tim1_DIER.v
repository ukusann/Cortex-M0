
module tim1_DIER(
    input wire rst,

    input wire ld_dier,

    input wire i_uie,
    input wire i_cc1ie,
    
    output wire o_uie,
    output wire o_cc1ie
    );

reg [1:0]TIMx_DIER;


assign o_uie   = TIMx_DIER[0];
assign o_cc1ie = TIMx_DIER[1];

always @(posedge ld_dier or posedge rst) begin
    if (rst) begin
        TIMx_DIER <= 0;
    end
    else begin
        TIMx_DIER <= {i_cc1ie, i_uie};
    end
end 

endmodule
