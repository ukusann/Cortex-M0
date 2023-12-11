`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2023 05:58:10 PM
// Design Name: 
// Module Name: op_ld_st
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
`include "Defines.v"

module op_ld_st(
    input wire clk,
    input wire rst,
    
    input wire inst_en,
    input wire [4:0] transf_f,
    
    input wire [31:0] Rn,
    input wire [31:0] op2,
    
    
    output wire [31:0] w_Rn,
    output wire [31:0] addr_mem
    );
    
    
    reg [31:0] rn;
    reg [31:0] addr_m;
    
    initial begin
        rn <= 32'd0;
        addr_m <= 32'd0;
    end    

// ____________________________________________________________________________
// ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ---- 
                    /* ---- ADDRESS OPERATION ---- */ 
        
    always @( negedge (clk & inst_en) or posedge rst) begin
        
        if (rst) begin
            rn <= 32'd0;
            addr_m <= 32'd0;
            
        end else begin
            if (transf_f[`P_I]) begin  
            // Pre-index
                
                addr_m = ( transf_f[`U_I] )? Rn + op2 : Rn - op2;
                
                if (transf_f[`W_I] ) begin  // Write Back
                    rn <= addr_m;
                end  
            end else begin
            // Post-index   
                
                addr_m <= Rn;
                
                if (transf_f[`W_I] ) begin  // Write Back
                    rn <= ( transf_f[`U_I] )? Rn + op2 : Rn - op2;
                end
            end
        end
    end

// ____________________________________________________________________________
// ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ----  ---- 
                    /* ---- OUTPUT ASSIGNS ---- */ 
    assign w_Rn     = rn;
    assign addr_mem = addr_m;
    
endmodule

