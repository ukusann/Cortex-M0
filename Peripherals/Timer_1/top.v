`define TIM1_CR1   4'h0
`define TIM1_DIER  4'h1
`define TIM1_SR    4'h2
`define TIM1_EGR   4'h3
`define TIM1_CNT   4'h4
`define TIM1_PSC   4'h5
`define TIM1_ARR   4'h6
`define TIM1_CCMR1 4'h7
`define TIM1_CCER  4'h8
`define TIM1_CCR1  4'h9
`define TIM1_NONE  4'ha


module top(
        input wire clk,
        input wire rst,
        
        output wire led_test,
        output wire run,

        output wire tim1_CC1P,
        output wire tim1_CC1NP
    );
    
    reg [7:0]counter;
    reg uif_rst;
    reg cc1if_rst;
    reg led_t;
    reg rst_init;
    
    reg [ 4:0] ld_tim1_reg;  // Loads TIM1 Register
    reg [31:0] data_reg;     // Data to write in the TIM1 Registers
        
    wire tim1_uif;       // Interrupt Update Event Flag
    wire tim1_cc1if;
initial begin

    led_t = 1;
    uif_rst <= 0;
    cc1if_rst <= 0;
    counter <= 8'h00;
    rst_init <= 1;
    ld_tim1_reg <= `TIM1_NONE;  // Loads TIM1 Register
    data_reg    <= 32'h00000000;     // Data to write in the TIM1 Registers
    
end


TIMER1 tim1(
    clk,
    rst | rst_init,
    
    ld_tim1_reg,  // Loads TIM1 Register
    data_reg,     // Data to write in the TIM1 Registers
    
    uif_rst,
    cc1if_rst,
        
    tim1_CC1P,         // Compare 1 Output Pin
    tim1_CC1NP,        // Compare 1 Complementary Output Pin 
    tim1_uif,     // Interrupt Update Event Flag
    tim1_cc1if    // Interrupt Rotine PWM Period Flag
    );
    
   
   assign led_test = led_t;
   
   assign run = 1;


always @(posedge clk ) begin
    
    ld_tim1_reg <= `TIM1_NONE;
  //  uif_rst <= 0;
  //  cc1if_rst <= 0;  

    if (counter == 8'h01) begin
        rst_init <= 0;
        ld_tim1_reg <= `TIM1_CNT;
        data_reg <= 32'h00000000;
    end
    else if (counter == 8'h02) begin
        ld_tim1_reg <= `TIM1_CR1;
        data_reg <= 32'h00000080 | 32'h00000020;
    end 
    else if (counter == 8'h03) begin   // Prescaler
            ld_tim1_reg <= `TIM1_PSC;
        data_reg <= 32'd2;     // 799    
    end 
    else if (counter == 8'h04) begin   // Auto-Reload
        ld_tim1_reg <= `TIM1_ARR;
        data_reg <= 32'd9999;  // 9999
    end
    else if (counter == 8'h05) begin
        ld_tim1_reg <= `TIM1_DIER;
        data_reg <= 32'h00000000 | 32'h00000000;
    end 
    else if (counter == 8'h06) begin
        ld_tim1_reg <= `TIM1_EGR;
        data_reg <= 32'h00000001 | 32'h00000002;
    end
    else if (counter == 8'h07) begin
        ld_tim1_reg <= `TIM1_CCMR1;
        data_reg <= 32'h00000001;
    end
    else if (counter == 8'h08) begin
        ld_tim1_reg <= `TIM1_CCR1;
        data_reg <= 32'd2500;
    end 
    else if (counter == 8'h09)begin
        ld_tim1_reg <= `TIM1_CCER;
        data_reg <= 32'h00000001 | 32'h00000004;
    end
    else if (counter == 8'h0a) begin
        ld_tim1_reg <= `TIM1_CR1;
        data_reg <= 32'h000000a1;
    end 
    
    if(counter <= 8'h0a )
        counter <= counter + 8'h01;
        
   
 end
    
endmodule