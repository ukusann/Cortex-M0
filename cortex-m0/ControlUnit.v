`timescale 1ns / 1ps

`define START   2'b00
`define FETCH   2'b01
`define DECODE  2'b10
`define EXECUTE 2'b11

module ControlUnit(
    input wire clk,
    input wire rst,
    
    // Control Signals
    
    input wire update_flags,
    input wire  write_rd,
    input wire  ig_ex,
    input wire  br_en,
    
    output wire cu_wr_mem,
    output wire cu_branch,
    
    output wire new_pc_en,
    output wire cu_decode,
    output wire cu_execute,
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
    
   
    wire [1:0] nx_st;
    reg  [1:0] st;
    
    
    
    initial begin
        
        st <= `START;
        
    end
   
   
//================================================================
// SIGNALS OUTPUT
   
    assign ld_sp      =  1'b0;
    assign ld_lr      =  1'b0;
    
    assign new_pc_en  =  !st[1] & !st[0] & 1'b1;
    assign ld_pc      =  new_pc_en & 1'b1;
    
    assign ld_rd      =  !st[1] & !st[0] & write_rd     & 1'b1;
    assign cu_branch  =  !st[1] & !st[0] & br_en     & 1'b1;
    
    assign ld_apsr    =  !st[1] & !st[0] & update_flags & 1'b1;
    assign ld_ipsr    =  !st[1] & !st[0] & 1'b0;
    assign ld_primask =  1'b0;
    
    
    assign cu_fetch   = !st[1] &  st[0];
    assign cu_decode  =  st[1] &  !st[0];
    assign cu_execute =  st[1] &  st[0];
    
    
    
    
//================================================================
// STATE MACHINE
    
    
    assign nx_st[1] = (!st[1] &  st[0]) | (!ig_ex &  st[1] & !st[0]);
    assign nx_st[0] = (!ig_ex & !st[0]) | (!st[1] & !st[0]);
    
    always @(posedge clk or posedge rst) begin
        
        if (rst)begin
            st <= `START;        
        end 
        else begin
            st <= nx_st;
        end
        
    end 
    

//================================================================
    
endmodule
