`timescale 1ns / 1ps

`include "Defines.v"

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
        
        // todo *****Adc test*****
        // !imm
        // ?ADCS, Rd, Rn, #2
        // 1110 0010 1011 0010 0011 0000 0000 0010
        // mem[4] <= 8'h02;
        // mem[5] <= 8'h30;
        // mem[6]<= 8'hb2;
        // mem[7]<= 8'he2;

        // ?ADC, Rd, Rn, #4095
        //* 1110 0010 1010 0010 0011 1111 1111 1111
        // mem[4] <= 8'hFF;
        // mem[5] <= 8'h3F;
        // mem[6]<= 8'ha2;
        // mem[7]<= 8'he2;
        
        // !reg
        // ?ADCS, Rd, Rn, Rm
        //* 1110 0000 1011 0010 0011 0000 0000 0001
        // mem[4] <= 8'h01;
        // mem[5] <= 8'h30;
        // mem[6] <= 8'hb2;
        // mem[7] <= 8'he0;

        // ?ADCS, Rd, Rn, Rm, LSL #1
        //* 1110 0000 1011 0010 0011 0000 1000 0001
        // mem[4] <= 8'h81;
        // mem[5] <= 8'h30;
        // mem[6] <= 8'hb2;
        // mem[7] <= 8'he0;
        // *******************

        // todo: *****Add test*****
        // !imm
        // ?ADD, Rd, Rn, #2
        //* 1110 0010 1001 0010 0011 0000 0000 0010
        // mem[4] <= 8'h02;
        // mem[5] <= 8'h30;
        // mem[6]<= 8'h92;
        // mem[7]<= 8'he2;

        // !reg
        // ?ADD, Rd, Rn, Rm
        //* 1110 0000 1001 0010 0011 0000 0000 0001
        // mem[4] <= 8'h01;
        // mem[5] <= 8'h30;
        // mem[6] <= 8'h92;
        // mem[7] <= 8'he0;

        // todo: *****Sbc test*****
        // !imm
        // ?SBC Rd, Rn, #2
        //* 1110 0010 1101 0010 0011 0000 0000 0010
        // mem[4] <= 8'h02;
        // mem[5] <= 8'h30;
        // mem[6]<= 8'hd2;
        // mem[7]<= 8'he2;

        // !reg
        // ?SBC, Rd, Rn, Rm
        //* 1110 0000 1101 0010 0011 0000 0000 0001
        // mem[4] <= 8'h01;
        // mem[5] <= 8'h30;
        // mem[6] <= 8'hd2;
        // mem[7] <= 8'he0;

        // todo: *****SUB test*****
        // !imm
        // ?SUB Rd, Rn, #5
        //* 1110 0010 0101 0010 0011 0000 0000 0101
        // mem[4] <= 8'h05;
        // mem[5] <= 8'h30;
        // mem[6]<= 8'h52;
        // mem[7]<= 8'he2;

        // !reg
        // ?SUB, Rd, Rn, Rm
        //* 1110 0000 0101 0010 0011 0000 0000 0001
        // mem[4] <= 8'h01;
        // mem[5] <= 8'h30;
        // mem[6] <= 8'h52;
        // mem[7] <= 8'he0;

        // todo: *****AND test*****
        // !imm
        // ?AND Rd, Rn, #2
        //* 1110 0010 0001 0010 0011 0000 0000 0010
        // mem[4] <= 8'h02;
        // mem[5] <= 8'h30;
        // mem[6]<= 8'h12;
        // mem[7]<= 8'he2;

        // !reg
        // ?AND, Rd, Rn, Rm
        //* 1110 0000 0001 0010 0011 0000 0000 0001
        // mem[4] <= 8'h01;
        // mem[5] <= 8'h30;
        // mem[6] <= 8'h12;
        // mem[7] <= 8'he0;
        
        // todo: *****OR test*****
        // !imm
        // ?OR Rd, Rn, #4
        //* 1110 0011 1001 0010 0011 0000 0000 0100
        // mem[4] <= 8'h04;
        // mem[5] <= 8'h30;
        // mem[6]<= 8'h92;
        // mem[7]<= 8'he3;

        // !reg
        // ?OR, Rd, Rn, Rm
        //* 1110 0001 1001 0010 0011 0000 0000 0001
        // mem[4] <= 8'h01;
        // mem[5] <= 8'h30;
        // mem[6] <= 8'h92;
        // mem[7] <= 8'he1;

        // todo: *****XOR test*****
        // !imm
        // ?XOR Rd, Rn, #3
        //* 1110 0010 0011 0010 0011 0000 0000 0011
        // mem[4] <= 8'h03;
        // mem[5] <= 8'h30;
        // mem[6]<= 8'h32;
        // mem[7]<= 8'he2;

        // !reg
        // ?XOR, Rd, Rn, Rm
        //* 1110 0000 0011 0010 0011 0000 0000 0001
        // mem[4] <= 8'h01;
        // mem[5] <= 8'h30;
        // mem[6] <= 8'h32;
        // mem[7] <= 8'he0;
        
        /*
        mem[12] <= 8'h04;
        mem[13] <= 8'h00;
        mem[14] <= 8'h00;
        mem[15] <= 8'h2a;
        
        mem[20] <= 8'h04;
        mem[21] <= 8'h00;
        mem[22] <= 8'h00;
        mem[23] <= 8'h4a;
        
        mem[28] <= 8'h04;
        mem[29] <= 8'h00;
        mem[30] <= 8'h00;
        mem[31] <= 8'h6a;
        */
        
        // LS AS and MOV test
        /*
         // reg 
        mem[4] <= 8'h32;
        mem[5] <= 8'h13;
        mem[6] <= 8'ha0;
        mem[7] <= 8'he1;
       */
        
        // imm
        // 1110 0001 1010 0000 0001 0000 1010 0010
        mem[8]  <= 8'ha2;
        mem[9]  <= 8'h10;
        mem[10] <= 8'ha0;
        mem[11] <= 8'he1;
         
        
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
