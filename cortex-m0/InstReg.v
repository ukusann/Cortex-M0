`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2023 05:57:14 PM
// Design Name: 
// Module Name: InstReg
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


module InstReg(
    input wire rst,
    input wire ld_ir,
    input wire [31:0] dout_flash,
    
    output wire [31:0] IR
    );
    
    reg [31:0] ir;
    
    initial begin
        ir <= 32'd0; 
    end
    
    // ===================================================================
                      /* ---- Output Assign ----*/
    assign IR = ir;
    
    // ===================================================================
                       /* ---- Update IR ---- */
    always @(negedge ld_ir  or posedge rst) begin
        
        if (rst)begin
                ir <= 32'd0;
        end 
        else begin
            ir = dout_flash;
        end
    end
    
endmodule
