module tim1_PSC(
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
