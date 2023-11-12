`timescale 1ns / 1ps

`define FETCH_DECODE 2'b00
`define EXECUTE      2'b01
`define MEM_WRITE    2'b10
`define INIT         2'b11


module ControlUnit(
    input wire clk,
    input wire rst,
    
    input wire flash_busy,
    // Control Signals
    
    input wire  update_flags,
    input wire  write_rd,
    input wire  ig_ex,
    input wire  br_en,
    input wire  br_L,
    
    // Memory Signals
    output wire ld_flash,
    
    // State Signals
    output wire cu_wr_mem,
    output wire cu_branch,
    
    output wire cu_execute,
    output wire ld_sp,
    output wire ld_lr,
    output wire ld_pc,
    output wire ld_ir,
    
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
    wire busy_mem;
    reg  init_mem;
   
    
//================================================================
// ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  --- 
//  INIT CONTROL UNIT
    
    initial begin
        
        st <= `INIT;
        init_mem = 1;
        
    end
   
//================================================================
// ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  --- 
//  OUTPUT SIGNALS
   
    assign ld_sp      =   st[1] & !st[0] & 1'b0;                // Stack Register
    assign ld_lr      =   st[1] & !st[0] & br_L & 1'b1;         // Link Register
    assign ld_pc      =   st[1] & !st[0] & 1'b1;                // Program Counter Register
    assign ld_ir      =  !st[1] & !st[0] & clk & 1'b1;          // Instruction Register
    
    assign ld_rd      =   st[1] & !st[0] & write_rd     & 1'b1; // Result Register
    assign cu_branch  =   st[1] & !st[0] & br_en     & 1'b1;    // Enable Branch
    
    assign ld_apsr    =   st[1] & !st[0] & update_flags & 1'b1; // APSR Flags Update
    assign ld_ipsr    =   st[1] & !st[0] & 1'b0;                // ISR Exception Number Register
    assign ld_primask =  1'b0;                                  // ISR Priority Register
    
    assign cu_execute =  !st[1] &  st[0];                       // Execute State
    
// ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  --- 
// MEMORY SIGNALS
 
    assign ld_flash = ld_pc; // Enable Read Flash
    
    
//================================================================
// ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  --- 
// STATE MACHINE
    
    assign nx_st[1] = (!st[1] &  st[0]) | (busy_mem & st[0]) | (!busy_mem & ig_ex &  !st[1]);
    assign nx_st[0] = ( busy_mem & st[1] & st[0]) | ( !busy_mem & !ig_ex & !st[1] & !st[0]);

// ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  --- 
    
    always @(posedge clk or posedge rst) begin
        
        if (rst)begin
            st <= `INIT;        
        end 
        else begin
            st <= nx_st;
        end
    end 
    
// ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  --- 

    assign busy_mem = init_mem | flash_busy;
        
    always @(posedge flash_busy or posedge rst) begin
        
        if (rst)begin
            init_mem <= 1;        
        end 
        else begin
            init_mem = 0;      
        end
    end

//================================================================
    
endmodule
