
module tim1_CCMR1(
    input wire rst,
    input wire ld_ccmr1,
    input wire [1:0] i_oc1m,

    output wire [1:0] o_oc1m
);

reg [1:0] TIMx_CCMR1;

assign o_oc1m = TIMx_CCMR1;


always @(posedge ld_ccmr1 or posedge rst) begin
    if (rst) begin
        TIMx_CCMR1 <= 0;
    end
    else begin
        TIMx_CCMR1 <= i_oc1m;
    end
end 

endmodule