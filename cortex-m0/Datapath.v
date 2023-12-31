`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2023 04:10:04 PM
// Design Name: 
// Module Name: Datapath
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


module Datapath(
    input wire clk,
    input wire rst,
    
    input wire wr_en,
    
    // Control Signals
    input wire ld_sp,
    input wire ld_lr,
    input wire ld_pc,
    
    // Register Signal
    input wire ld_rd,
    
    // Program Status Registers Signals
    input wire ld_apsr,
    input wire ld_ipsr,
    
    // Priority Mask Register Signal
    input wire ld_primask
    );
  
// ____________________________________________________________________________________________________
// ====================================================================================================
// ====================================================================================================
// ====================================================================================================
                                /* Memory and Core Registers*/
  
    reg [31:0] base_addr;
    reg [31:0] w_data;
        
    wire [31:0] r_data;
    
    wire [31:0] w_SP;     // Write Stack Pointer 
    wire [31:0] w_LR;     // Write Link Register 
    wire [31:0] w_PC;     // Write Program Counter 
     
    wire [31:0] w_Rd;     // Write destanation Reg 
    wire [ 3:0] addr_Rn;  // Rn address
    wire [ 3:0] addr_Rm;  // Rm address
    wire [ 3:0] addr_Rd;  // Rd address

    wire w_n, w_z, w_c, w_v;  // Read Conditional Flags
    wire [ 5:0] w_IPSR;   // Write Exception Numbers
    
    wire w_PMask;         // Write Enable Priority
    
    wire [31:0] SP;       // Stack Pointer 
    wire [31:0] LR;       // Link Register 
    wire [31:0] PC;       // Program Counter 
    
    wire [31:0] Rn;       // Rn
    wire [31:0] Rm;       // Rm
    wire [31:0] Rd;       // Destination Register
    
    wire n, z, c, v;      // Conditional Flags
    wire [ 5:0] IPSR;   // Exception Numbers
    
    wire PMask;           // Enable Priority
  
    initial begin
        base_addr <= 32'h00000004;
        w_data    <= 32'h00000000;
        
    end
      
    
    // - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - - 
    // - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - - 
    
    Memory mem(
            clk,rst, 
            wr_en,   
            base_addr, 
            w_data, 
            r_data );
               
    // - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - - 
    // - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - - 
               
    coreRegisters CoreReg(
    // System Signals
            clk, rst,
            
    // Control Signals
            ld_sp,
            ld_lr,
            ld_pc,
    
    // Register Signal
            ld_rd,
            
    // Program Status Registers Signals
            ld_apsr,
            ld_ipsr,
            
    // Priority Mask Register Signal
            ld_primask,
   
    // Core Control Registers:
            w_SP,     // Write Stack Pointer 
            w_LR,     // Write Link Register 
            w_PC,     // Write Program Counter 
    
    // General Purpose Registers
            w_Rd,     // Write destanation Reg 
            addr_Rn,  // Rn address
            addr_Rm,  // Rm address
            addr_Rd,  // Rd address
    
    // Program Status Registers bits  
            {w_n, w_z, w_c, w_v},   // Write ondicional Flags
            w_IPSR,                 // Write Exception Numbers
    
    // Priority Mask Register
            w_PMask,  // Write Enable Priority
    
    // Core Control Registers:
            SP,       // Read Stack Pointer 
            LR,       // Read Link Register 
            PC,       // Read Program Counter 
    
    // General Purpose Registers
            Rn,      // Read Rn
            Rm,      // Read Rm
            Rd,      // Read destanation Register
    
    // Program Status Registers bits
            {n, z, c, v},  // Read Conditional Flags
            IPSR,          // Read Exception Numbers
    
    // Priority Mask Register
            PMask    // Read Enable Priority
    );
    
    // - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - - 
    // - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - -  - - - - 
 
 
 //================================================================
 // Core Register Write Test
    
    assign w_SP = 32'h00000002; 
    assign w_LR = 32'hff00ff03; 
    assign w_PC = 32'h04030102;
    
    assign w_Rd = 32'h06fffff2;     
    assign addr_Rn = 4'h0;
    assign addr_Rm = 4'h1;
    assign addr_Rd = 4'h2;  

    assign { w_n, w_z, w_c, w_v } = {1'b1, 1'b1, 1'b1, 1'b1};
    assign w_IPSR = 6'h12;  
    assign w_PMask = 1'b1; 
    
           
 //================================================================
 // Write memory Test
  /*             
     always @(negedge wr_en or posedge rst) begin
        
        if (rst)begin
            w_data <= 32'h00000004;        
        end 
        else if (!wr_en) begin
            w_data <= w_data + 32'h00000005;
        
        end
    end */
    
    
 //================================================================
 // Read memory Test   
    /*always @(posedge clk or posedge rst) begin
        
        if (rst)begin
            w_data <= 32'h00000004;        
        end 
        else if (c == 8'd5) begin
            base_addr <= 32'd250;
        end
        else begin
            c <= c+1;
        end
    end*/
endmodule
