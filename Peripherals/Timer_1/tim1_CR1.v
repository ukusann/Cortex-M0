module tim1_CR1(
    input wire rst,

    input wire ld_cr1,

    input wire i_tim1_CEN,
    input wire i_tim1_UDIS,
    input wire i_tim1_URS,
    input wire i_tim1_OPM,
    input wire i_tim1_DIR,
    input wire [1:0] i_tim1_CMS,
    input wire i_tim1_ARPE,

    output wire [7:0] o_tim1_cr1
    );

reg [7:0] TIMx_CR1;


assign o_tim1_cr1 = TIMx_CR1;


always @(posedge ld_cr1 or posedge rst) begin
    if (rst) begin
        TIMx_CR1 <= 0;
    end
    else begin
        TIMx_CR1 <= {
            i_tim1_ARPE,
            i_tim1_CMS,
            i_tim1_DIR,
            i_tim1_OPM,
            i_tim1_URS,
            i_tim1_UDIS,
            i_tim1_CEN
        };
    end
end 

endmodule
