`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Marco Cunha
// 
// Create Date: 12/09/2023 06:52:16 PM
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
        input wire clk,
        input wire rst,
        
        output wire led_test,
        output wire run
        
    );
    
    reg [7:0]counter;
    reg ISR_rst;
    reg led_t;
    reg rst_init;
    
    reg tim6_reg_update;
    reg [ 3:0] ld_tim6_reg;  // Loads TIM6 Register
    reg [31:0] data_reg;     // Data to write in the TIM6 Registers
        
    wire tim6_uif;       // Interrupt Update Event Flag
      
initial begin

    led_t = 0;
    ISR_rst <= 0;
    counter <= 8'h00;
    rst_init <= 1;
    ld_tim6_reg <= 4'h7;  // Loads TIM6 Register
    data_reg    <= 32'h00000000;     // Data to write in the TIM6 Registers
    
end


TIMER6 tim6(
    clk,
    rst | rst_init,
    
    ld_tim6_reg,  // Loads TIM6 Register
    data_reg,     // Data to write in the TIM6 Registers
    
    ISR_rst,
    tim6_uif       // Interrupt Update Event Flag
    );
    
   
   assign led_test = led_t;
   
   assign run = 1;
   
    
always @(posedge clk ) begin
    
    ld_tim6_reg <= 4'h7;
    ISR_rst <= 0;  

    if (counter == 8'h01) begin
        rst_init <= 0;
    end
    else if (counter == 8'h02) begin
        ld_tim6_reg <= 4'h0;
        data_reg <= 32'h00000080;
    end 
    else if (counter == 8'h03) begin   // Prescaler
        ld_tim6_reg <= 4'h5;
        data_reg <= 32'd799;     // 799    
    end 
    else if (counter == 8'h04) begin   // Auto-Reload
        ld_tim6_reg <= 4'h6;
        data_reg <= 32'd9999;  // 9999
    end
    else if (counter == 8'h05) begin
        ld_tim6_reg <= 4'h1;
        data_reg <= 32'h00000001;
    end 
    else if (counter == 8'h06) begin
        ld_tim6_reg <= 4'h3;
        data_reg <= 32'h00000001;
    end 
    else if (counter == 8'h07) begin
        ld_tim6_reg <= 4'h0;
        data_reg <= 32'h00000081;
    end 
    
    if(counter <= 8'h08 )
        counter <= counter + 8'h01;
        
    if (tim6_uif) begin
        ISR_rst <= 1;
        led_t <= led_test ^ 1;
    end
 end
    
endmodule
