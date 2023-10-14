`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2023 02:10:57 PM
// Design Name: 
// Module Name: coreRegisters
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


`define SP_I 4'hd   // Stack Pointer
`define LR_I 4'he   // Link Register
`define PC_I 4'hf   // Program Counter
`define SIZE_CREG_I 5'd16 // Size of the 

`define N_I 5'd31   // Negative
`define Z_I 5'd30   // Zero
`define C_I 5'd29   // Carry
`define V_I 5'd28   // Overflow
 
`define EXCEP_NUM  3'd5 



module coreRegisters(

    // System Signals
    input wire clk,
    input wire rst,
    
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
    input wire ld_primask,
    
   
    // Core Control Registers:
    input wire [31:0] w_SP,     // Write Stack Pointer 
    input wire [31:0] w_LR,     // Write Link Register 
    input wire [31:0] w_PC,     // Write Program Counter 
     
    
    // General Purpose Registers
    input wire [31:0] w_Rd,     // Write destanation Reg 
    input wire [ 3:0] addr_Rn,  // Rn address
    input wire [ 3:0] addr_Rm,  // Rm address
    input wire [ 3:0] addr_Rd,  // Rd address
    
    
    // Program Status Registers bits  
    input wire [ 3:0] w_APSR,   // Write ondicional Flags
    input wire [ 5:0] w_IPSR,   // Write Exception Numbers
    
    
    // Priority Mask Register
    input wire w_PMask,        // Write Enable Priority
    
    
    // Core Control Registers:
    output wire [31:0] r_SP,     // Read Stack Pointer 
    output wire [31:0] r_LR,     // Read Link Register 
    output wire [31:0] r_PC,     // Read Program Counter 
    
    
    // General Purpose Registers
    output wire [31:0] Rn,      // Read Rn
    output wire [31:0] Rm,      // Read Rm
    output wire [31:0] r_Rd,    // Read destanation Register
    
    
    // Program Status Registers bits
    output wire [ 3:0] r_APSR,  // Read Conditional Flags
    output wire [ 5:0] r_IPSR,  // Read Exception Numbers
    
    
    // Priority Mask Register
    output wire r_PMask         // Read Enable Priority
    );
    
    
    
//=========================================================
/* Indexed Core Register: */
    reg [31:0]core_reg[0:15]; 

/* Unindexed Core Register: */
    reg [31:0] PSR;       // Program Status Register
    reg [31:0] PRIMASK;   // Priority Mask Register

/**/
//=========================================================
    
// =====================================================================================
// Core Registers Tasks:
    task resetCoreReg();
    reg [4:0] i;
    begin
            for ( i = 5'd0; i < `SIZE_CREG_I; i = i + 1) begin
                    core_reg[i] <= 32'h00000000;
            end
            
            core_reg[`LR_I] <= 32'hffffffff;
            PSR <= 32'h0000003f;
            PRIMASK <= 32'h00000000;
            
            // Test
            core_reg[0] <= 32'hfefefe00;
            core_reg[1] <= 32'hfe001200;
            
      end
    endtask
    
// =====================================================================================
// Core Registers Initializations:
    
    initial begin
        resetCoreReg();
    end
    

// =====================================================================================
// Core Registers Output Assings:
    
    // Core Control Registers:
    assign r_SP = core_reg[`SP_I];     // Read Stack Pointer 
    assign r_LR = core_reg[`LR_I];     // Read Link Register 
    assign r_PC = core_reg[`PC_I];     // Read Program Counter 
    
    // General Purpose Registers
    assign Rn = core_reg[addr_Rn];
    assign Rm = core_reg[addr_Rm];
    assign r_Rd = core_reg[addr_Rd];
    
    // APSR - Condition Flags
    assign r_APSR = { PSR[`N_I], PSR[`Z_I] , PSR[`C_I] , PSR[`V_I]  };
          
    // IPSR - Exeptions Numbers
    assign r_IPSR = PSR[5:0];
    
        // PRIMASK - P - Priority Mask Register
    assign r_PMask = { PRIMASK[0]};



// =====================================================================================
// Core Registers Write:
    
    always @(negedge clk or posedge rst) begin
    
         if (rst)begin
                resetCoreReg();
        end 
    
        else begin 
            if (ld_sp) begin
              core_reg[`SP_I] <= w_SP;      // Writes in the Stack Pointer  
            end
            if (ld_lr) begin
              core_reg[`LR_I] <= w_LR;      // Writes in the Link Register
            end
            if (ld_pc) begin
              core_reg[`PC_I] <= w_PC;      // Writes in the Program Counter
            end
            
            if (ld_rd) begin
              core_reg[addr_Rd] <= w_Rd;    // Writes in the Destination Register
            end
            
            if (ld_apsr) begin
              // Writes in the Condition Flgas
              PSR[`N_I] <= w_APSR[3];
              PSR[`Z_I] <= w_APSR[2];
              PSR[`C_I] <= w_APSR[1];
              PSR[`V_I] <= w_APSR[0];
              
            end
            
            if (ld_ipsr) begin
              // Writes in the Exception Number
              PSR[5:0] <=  w_IPSR;
            end
            
            if (ld_primask) begin
              PRIMASK[0] <= w_PMask;    // Writes in the Priority Mask Register
            end
        end
    end 
    
endmodule

    