

module TIM1_SR_isr(
    input wire ld_isr,
    input wire rst_isr,
    input wire i_isr,
    output wire o_isr
);

reg TIMx_isr;

assign o_isr = TIMx_isr;

always @(posedge ld_isr or posedge rst_isr) begin
    if (rst_isr) begin
        TIMx_isr <= 0;
    end
    else begin
        TIMx_isr <= i_isr;
    end
end
endmodule



// =================================================================
// =================================================================
// =================================================================

module tim1_SR(

    input wire ld_sr_uif,
    input wire ld_sr_cc1if,
    input wire rst_uif,
    input wire rst_cc1if,
    
    input wire i_uif,
    input wire i_cc1if,

    output wire o_uif,
    output wire o_cc1if
    );
 
    TIM1_SR_isr tim1_sr_uif(
        .ld_isr(ld_sr_uif),
        .rst_isr(rst_uif),
        .i_isr(i_uif),
        .o_isr(o_uif)
    );

    TIM1_SR_isr tim1_sr_cc1if(
        .ld_isr(ld_sr_cc1if),
        .rst_isr(rst_cc1if),
        .i_isr(i_cc1if),
        .o_isr(o_cc1if)
    );
endmodule
