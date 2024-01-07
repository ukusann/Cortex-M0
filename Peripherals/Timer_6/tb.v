`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2023 09:08:29 PM
// Design Name: 
// Module Name: tb
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

`define SIM_COUNTER 8'h1E

module tb(

    );

reg [7:0]counter;
reg clk, rst;
reg ISR_rst;

reg tim6_reg_update;
reg [ 3:0] ld_tim6_reg;  // Loads TIM6 Register
reg [31:0] data_reg;     // Data to write in the TIM6 Registers
    
wire tim6_uif;       // Interrupt Update Event Flag


initial begin
    clk <= 0;
    rst <= 0;
    ISR_rst <= 0;
    counter <= 8'h00;
    
    ld_tim6_reg <= 4'h7;  // Loads TIM6 Register
    data_reg    <= 32'h00000000;     // Data to write in the TIM6 Registers
    
end

   
   // clock
always #62 clk = ~clk;


/*
TIM6 tim6(
    clk,
    rst,
    
    ld_tim6_reg,  // Loads TIM6 Register
    data_reg,     // Data to write in the TIM6 Registers
    
    ISR_rst,
    tim6_uif       // Interrupt Update Event Flag
    );
    
    


always @(posedge clk) begin
    ld_tim6_reg <= 4'h7; 
    if (counter == 8'h02) begin
        ld_tim6_reg <= 4'h0;
        data_reg <= 32'h00000080;
    end 
    else if (counter == 8'h03) begin
        ld_tim6_reg <= 4'h5;
        data_reg <= 32'h00000001;
    end 
    else if (counter == 8'h04) begin
        ld_tim6_reg <= 4'h6;
        data_reg <= 32'h0000000A;
    end
    else if (counter == 8'h05) begin
        ld_tim6_reg <= 4'h2;
        data_reg <= 32'h00000001;
    end 
    else if (counter == 8'h06) begin
        ld_tim6_reg <= 4'h3;
        data_reg <= 32'h00000001;
    end 
    else if (counter == 8'h07) begin
        ld_tim6_reg <= 4'h0;
        data_reg <= 32'h00000081;
    
    else if (counter == `SIM_COUNTER-1) begin
        ISR_rst <= 1;
    end 
    else if (counter == `SIM_COUNTER) begin
        $finish;
    end
    
   
    counter = counter + 8'h01;
 end

*/


wire led_test;

top top (
    clk, rst,
    led_test
);

endmodule
