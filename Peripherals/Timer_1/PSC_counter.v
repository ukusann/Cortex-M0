
module PSC_counter(
    input wire clk,
    input wire rst,
    
    input wire [15:0] psc_reg, // Prescaler Shadow Register
    
    output wire tim_clk        // Clock Signal Generated
    
    );
    
    reg[15:0] psc_cnt;
    wire psc_ov;
    

 
// ===============================================================
            /* <<<< Assign TIMER Signals >>>> */

    // Prescalser Overflow
    assign psc_ov = psc_cnt == psc_reg; 
    
    // Timerx Counter Clock Genertor
    assign tim_clk = clk  & psc_ov;
    
    
// ===============================================================
            /* <<<< Prescaler Counter >>>> */

always @(negedge clk or posedge rst) begin
    if (rst)begin
        psc_cnt <= 0;
    end
    else begin
        psc_cnt <= (psc_cnt +1) & {16{ !psc_ov }};
    end
end

endmodule
