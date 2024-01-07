
module tim1_CCR1(
    input wire rst,
    input wire ld_ccr1,
    input wire [15:0] i_ccr1,
    output wire [15:0] o_ccr1
);

reg [15:0] TIMx_CCR1;

assign o_ccr1 = TIMx_CCR1;


always @(posedge ld_ccr1 or posedge rst) begin
    if (rst) begin
        TIMx_CCR1 <= 0;
    end
    else begin
        TIMx_CCR1 <= i_ccr1;
    end
end 

endmodule