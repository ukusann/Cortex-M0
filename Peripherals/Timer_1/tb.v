
module tb(
    );

reg clk, rst;
wire led_test;
wire tim1_CC1P;
wire tim1_CC1NP;
wire run;
initial begin
    clk <= 0;
    rst <= 0;
end

   
   // clock
always #62 clk = ~clk;

top top (
    clk, rst,
    led_test,
    run,
    tim1_CC1P,
    tim1_CC1NP
);

endmodule