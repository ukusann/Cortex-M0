// ****Memory***
`define MEM_ADDR_SIZE  8'h7

`define MEM_ROM_SIZE        32'h0001ffff
`define MEM_SRAM_SIZE       32'h0000ffff
`define MEM_PERIPHERAL_SIZE 32'h0000ffff

`define ADDR_ROM        32'h00000000
`define ADDR_SRAM       32'h00020000
`define ADDR_PERIPHERAL 32'h00030000

`define MEM_SIZE `MEM_ROM_SIZE + `MEM_SRAM_SIZE + `MEM_PERIPHERAL_SIZE
//`define MEM_SIZE 8'hff

// ****Core Rsgisters***
`define SP_I 4'hd   // Stack Pointer
`define LR_I 4'he   // Link Register
`define PC_I 4'hf   // Program Counter
`define SIZE_CREG_I 5'd16 // Size of the 

`define N_I 5'd31   // Negative
`define Z_I 5'd30   // Zero
`define C_I 5'd29   // Carry
`define V_I 5'd28   // Overflow
 
`define EXCEP_NUM  3'd5 

// ****Instruction Register***
// Instructions 
`define ADD       5'h00
`define ADC       5'h01
`define SUB       5'h02
`define SBC       5'h03
`define AND       5'h04
`define ORR       5'h05
`define EOR       5'h06
`define BIC       5'h07
`define MOV_LAS   5'h08
`define CPSI      5'h09
`define WFI       5'h0a
`define ERET      5'h0b
`define BX        5'h0c
`define B         5'h0d
`define LD        5'h0e
`define ST        5'h0f
`define NO_INST   5'h1f

// OPCODES:    
`define OP_ADCS  4'b0101    // Add with Carry   
`define OP_ADDS  4'b0100    // Add without Carry 
`define OP_SUBS  4'b0010    // Sub without Carry 
`define OP_SBCS  4'b0110    // Sub with Carry 
`define OP_ANDS  4'b0000    // Logical AND 
`define OP_ORRS  4'b1100    // Logical OR 
`define OP_EORS  4'b0001    // Logical XOR

`define OP_BIC       4'b1110 // Performs an Logical AND with the logical negation of the corresponding bits 
`define OP_MOV_LAS   4'b1101 // Mov and Logical and Arithemetics Shifts   
`define OP_MOVW_CPSI 4'b1000 // Mov word (16 bits) and CPSIE and CPSID
`define OP_BX        4'b1001 // Branch and Exchange
`define OP_ERET      4'b1011 // Exceptions Return

// COND defines:
`define COND_EQ 4'h0 // Equal
`define COND_NE 4'h1 // NOT Equal
`define COND_CS 4'h2 // CARRY SET
`define COND_CC 4'h3 // CARRY CLEAR
`define COND_MI 4'h4 // Negative
`define COND_PL 4'h5 // Negative or Zero
`define COND_VS 4'h6 // OVERFLOW has occurred
`define COND_VC 4'h7 // OVERFLOW has not occurred
`define COND_HI 4'h8 // Equal
`define COND_AL 4'he // Always (ignor flags)
`define COND_UN 4'hF // Unconditional Instruction

// Shift Types:
`define STYPE_LL 2'b00 // Logical Shift Left
`define STYPE_LR 2'b01 // Logical Shift Right
`define STYPE_AR 2'b10 // Logical Arithmetic Shift Right
`define STYPE_RR 2'b11 // Logical Rotate Right

// ***ALU***
// ALU control signals
`define ALU_OP_LEN 4   // Operation type
`define ALU_OP_NO_INST  `ALU_OP_LEN'd0 
`define ALU_OP_LSR_IMM  `ALU_OP_LEN'd1 
`define ALU_OP_LSR_REG  `ALU_OP_LEN'd2