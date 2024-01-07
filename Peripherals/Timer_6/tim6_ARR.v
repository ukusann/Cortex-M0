module tim6_ARR(
    input wire rst,

    input wire ld_barr,

    input wire [15:0] i_barr,

    output wire [15:0] o_barr

    );

reg [15:0]TIMx_barr;


assign o_barr = TIMx_barr;


always @(posedge ld_barr or posedge rst) begin
    if (rst) begin
        TIMx_barr <= 16'hffff;
    end
    else begin
        TIMx_barr <= i_barr;
    end
end 

endmodule