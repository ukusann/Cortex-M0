`timescale 1ns / 1ps

module LEDs(
    input clk,            // Clock source
    input rst,            // Reset 
    input led_en,         // Enable the LEDS
    input [31:0] i_reg,   // Register data
    output [3:0] o_leds   // Ouput LEDs
    );
    
    // LEDs
    reg [3:0] leds;
    
    // Assign the output
    assign o_leds = leds;
    
    // Initial Conditions
    initial begin
        leds <= 4'd0;
    end
    
     // LEDs values
    always @(posedge (clk & led_en) or posedge rst)
    begin
        if (rst) begin
            leds <= 4'd0;
        end
        else begin      
            leds <= i_reg[3:0];
        end
    end    
    
endmodule