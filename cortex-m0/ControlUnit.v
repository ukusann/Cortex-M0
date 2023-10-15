`timescale 1ns / 1ps


module ControlUnit(
    input wire clk,
    input wire rst,
    
    // Control Signals
    output wire cu_wr_mem,
    output wire cu_decode,
    output wire ld_sp,
    output wire ld_lr,
    output wire ld_pc,
    
    // Register Signal
    output wire ld_rd,
    
    // Program Status Registers Signals
    output wire ld_apsr,
    output wire ld_ipsr,
    
    // Priority Mask Register Signal
    output wire ld_primask
    
    );
    
   
    reg [8:0] count;
    
    initial begin
        count <= 4;
    end
   
   
   
   
//================================================================
// Core Register Write Test
   
    assign ld_sp      = (count == 8'd1 ) & 1'b1;
    assign ld_lr      = (count == 8'd3 ) & 1'b1;
    assign ld_pc      = (count == 8'd5 ) & 1'b1;
    assign ld_rd      = (count == 8'd5 ) & 1'b0;
    assign ld_apsr    = (count == 8'd10 ) & 1'b1;
    assign ld_ipsr    = (count == 8'd11 ) & 1'b1;
    assign ld_primask = (count == 8'd13 ) & 1'b1;
    
    assign cu_decode = (count == 8'd8 );
    
    always @(posedge clk or posedge rst) begin
        
        if (rst)begin
            count <= 8'h00;        
        end 
        else if(count < 8'd9) begin
            count <= count + 8'h01;
        end 
        else begin
            $finish;
        end
        
    end 

//================================================================
    
endmodule
