`timescale 1ns / 1ps

`define MEM_ADDR_SIZE  8'h7

`define MEM_ROM_SIZE        32'h0001ffff
`define MEM_SRAM_SIZE       32'h0000ffff
`define MEM_PERIPHERAL_SIZE 32'h0000ffff

`define ADDR_ROM        32'h00000000
`define ADDR_SRAM       32'h00020000
`define ADDR_PERIPHERAL 32'h00030000

`define MEM_SIZE `MEM_ROM_SIZE + `MEM_SRAM_SIZE + `MEM_PERIPHERAL_SIZE
//`define MEM_SIZE 8'hff


module Memory(
    input wire clk,
    input wire rst,
    input wire w_sram_en,
    input wire [31:0] code_addr,
    input wire [31:0] sram_addr,
    input wire [31:0] w_sram,
    
    output wire [31:0]r_code,
    output wire [31:0]r_sram
       
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
        
         // reg 
        mem[4] <= 8'h32;
        mem[5] <= 8'h13;
        mem[6] <= 8'ha0;
        mem[7] <= 8'he1;
        
        
         /* // imm
        mem[4] <= 8'ha2;
        mem[5] <= 8'h11;
        mem[6] <= 8'ha0;
        mem[7] <= 8'he1;
        */
        
    end
    // Reg :1110 0001   1010 0000    Rd=xxxx Rs=xxxx     001'I=1 Rm=xxxx	
    
    // Imm :1110 0001   1011 0000    Rn=xxxx [imm4!=0 : imm5 01'I = 0 : Rm = xxxx]
    
    // =====================================================================================
    // Reads from the memory
    
    
    // =====================================================================================
    // Writes in the memory
    always @(posedge clk or posedge rst) begin
        
        if (rst)begin
                resetMem();
        end 
        else if (w_sram_en) begin
            mem[`ADDR_SRAM + sram_addr   ] <= w_sram[7:0];
            mem[`ADDR_SRAM + sram_addr +1] <= w_sram[15:8];
            mem[`ADDR_SRAM + sram_addr +2] <= w_sram[23:16];
            mem[`ADDR_SRAM + sram_addr +3] <= w_sram[31:24];
            
        end
    end 
    
    // =====================================================================================
    // Reads from the memory
    
    assign r_code = { mem[`ADDR_ROM + code_addr +3],
                      mem[`ADDR_ROM + code_addr +2],
                      mem[`ADDR_ROM + code_addr +1],
                      mem[`ADDR_ROM + code_addr   ]};
                      
    
    assign r_sram = { mem[`ADDR_SRAM + sram_addr +3],
                      mem[`ADDR_SRAM + sram_addr +2],
                      mem[`ADDR_SRAM + sram_addr +1],
                      mem[`ADDR_SRAM + sram_addr   ]};                  
    
endmodule
