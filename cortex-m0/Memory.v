`timescale 1ns / 1ps

`define MEM_ADDR_SIZE  8'h7

`define MEM_ROM_SIZE        32'h0001ffff
`define MEM_SRAM_SIZE       32'h0000ffff
`define MEM_PERIPHERAL_SIZE 32'h0000ffff

`define MEM_SIZE `MEM_ROM_SIZE + `MEM_SRAM_SIZE + `MEM_PERIPHERAL_SIZE
//`define MEM_SIZE 8'hff


module Memory(
    input wire clk,
    input wire rst,
    input wire w_en,
    input wire [31:0] base_addr,
    input wire [31:0] w_data,
    
    output wire [31:0]r_data   
    );
    
    
    
    // =====================================================================================
    // Memory definition:
    
    reg [`MEM_ADDR_SIZE:0] mem [0 : `MEM_SIZE];
    reg [31:0] read_data;
    
    // =====================================================================================
    // Memory Tasks:
    task resetMem();
        reg [31:0] i;
        
        for ( i = 32'd0; i < `MEM_SIZE; i = i + 1) begin
                mem[i] <= 8'b00000000;
            end
    endtask
    
    // =====================================================================================
    // Memory Tasks:
    initial begin
        resetMem();
        read_data <= 31'd0;
        
        // test 
        mem[250] <= 8'hff;
        mem[251] <= 8'hdc;
        mem[252] <= 8'hba;
        mem[253] <= 8'h98;
    end
    
    
    // =====================================================================================
    // Reads from the memory
    
    
    // =====================================================================================
    // Writes in the memory
    always @(posedge clk or posedge rst) begin
        
        if (rst)begin
                resetMem();
        end 
        else if (w_en) begin
            mem[base_addr   ] <= w_data[7:0];
            mem[base_addr +1] <= w_data[15:8];
            mem[base_addr +2] <= w_data[23:16];
            mem[base_addr +3] <= w_data[31:24];
            
            
        
        end
    end 
    
    // =====================================================================================
    // Reads from the memory
    
    assign r_data = { mem[base_addr +3],
                      mem[base_addr +2],
                      mem[base_addr +1],
                      mem[base_addr   ]};
    
endmodule
