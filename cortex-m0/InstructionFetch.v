`timescale 1ns / 1ps
/** 
* TODO: IR of Data Processing
* * 32 bits
* * 0000 | 00 | 0 | 0000 | 0 | 0000 | 0000 | 0000 0000 0000
* * Cond op0op1 I    Op    S    Rn     Rd       Operand 2
*
* ? Cond: Condition Field
* ? op0 and op1: Instruction Type
* ? I: Immediate Operand
* If 0, operand 2 is a register
* * Operand 2:
* * 0000 0000 | 0000
* *   Shift      Rm
* ? Op: Opcode
* ? S: Set condition codes
* ? Rn: 1st Operand Register
* ? Rd: Destination Register
* ? Operand 2: 
* *  0000 | 0000 0000
* * Rotate   Immediate
* 
*
* * **************************************************
* * **************************************************
* TODO: IR of Single Data Transfer (LDR, STR)
* * 32 bits
* * 0000 | 00 | 0 | 0 | 0 | 0 | 0 | 0 | 0000 | 0000 | 0000 0000 0000
* * Cond op0op1 I   P   U   B   W   L    Rn     Rd        Offset
*
* ? Cond: Condition Field
* ? op0 and op1: Instruction Type
* ? I: Immediate offset
* * If 0, offset is an immediate value
* ? P: Pre/Post Indexing bit
* * If 0 = Post; add offset after transfer
* * If 1 = Pre; add offset before transfer
* ? U: Up/Down bit
* * If 0 = Down; subtract offset from base
* * If 1 = Up; add offset to base
* ? B: Byte/Word bit
* * If 0 = Tranfer word quantity
* * If 1 = Tranfer byte quantity
* ? W: Write-back bit
* * If 0 = No write-back
* * If 1 = Write address into base
* ? L: Load/Store bit 
* * If 0 = Store to memory
* * If 1 = Load from memory
* ? Rn: Base Register
* ? Rd: Source/Destination Register
* ? Offset
* * If I = 1
* *  0000 0000 | 0000
* *     Shift     Rm
*/

 
 
 module instructionFetch(clk, rst, IR);

// ==============================================================
// ========================= INPUTS =============================

input wire clk;
input wire rst;
input [31:0] IR; // Instruction Register


// ==============================================================
// ========================= OUTPUTS ============================


// ==============================================================
// ===================== Internal Variables =====================

/* Common to all instruction types */
wire [3:0] cond;      // Condition field
wire op0;             // op0 to define instruction type
wire op1;             // op1 to define instruction  
wire I;               // Immediate Operand or Immediate Offset         
wire [3:0] Rn;        // 1st Operand Register or base register   
wire [3:0] Rd;        // Destination Register or source
wire [11:0] offsetOperand2; // 2nd Operand or Offset

/* Data processing and Uncondition Instructions */
wire [3:0] opcode;    // Opcode
wire S;               // Set condition codes    
wire [1:0] imod;      // Interrupt mode
wire M;               // Change mode signal
wire [7:0] imm8;      // Constant 8 bit value 
wire A;               // Asynchronous Abort
wire IRQ;             // IRQ disable
wire FIQ;             // FIQ disable
wire bit5;            // bit 5 of Uncond Instructions
wire [4:0] mode;      // Processor mode to be changed

/*  Branch */
wire Link;               // Link bit 
wire [23:0] offset24; // Branch offset  

/* Single Data Transfer*/
wire P;               // Pre/Post Indexing bit
wire U;               // Up/Down bit
wire B;               // Byte/Word bit
wire W;               // Write-back bit
wire L;               // Load/Store bit

reg data_proc;
reg single_transf;
reg uncond;
reg branch;

initial begin
    data_proc = 1'b0;
    single_transf = 1'b0;
    uncond = 1'b0;
    branch = 1'b0;
end

assign cond     = IR[31:28];
assign op0      = IR[27];
assign op1      = IR[26];
assign I        = branch ? 1'b1 : IR[25];
assign opcode   = data_proc ? IR[24:21] : 4'h0;
assign S        = data_proc ? IR[20] : 1'b0; 
assign imod     = uncond ? IR[19:18] : 8'h0;
assign M        = uncond ? IR[17] : 1'b0;
assign imm8     = 8'h0;
assign A        = uncond ? IR[8] : 1'b0;
assign IRQ      = uncond ? IR[7] : 1'b0;
assign FIQ      = uncond ? IR[6] : 1'b0;
assign bit5     = 1'b0;
assign mode     = uncond ? IR[4:0] : 5'h0;
assign Link     = branch ? IR[24] : 1'b0;
assign offset24 = branch ? IR[23:0] : 23'h0;
assign P        = single_transf ? IR[24] : 1'b0;
assign U        = single_transf ? IR[23] : 1'b0;
assign B        = single_transf ? IR[22] : 1'b0;
assign W        = single_transf ? IR[21] : 1'b0;
assign L        = single_transf ? IR[20] : 1'b0;
assign Rn       = (data_proc | single_transf) ? IR[19:16] : 4'h0;
assign Rd       = (data_proc | single_transf) ? IR[15:12] : 4'h0;
assign offsetOperand2 = (data_proc | single_transf) ? IR[11:0] : 11'h0;


always @(posedge clk) begin

    if (rst) begin
        data_proc     <= 1'b0;
        single_transf <= 1'b0;
        uncond <= 1'b0;
        branch <= 1'b0;
    end
        
    else if (cond != 4'b1111) begin
        if(op0 == 1'b0) begin
            if(op1 == 1'b0) begin 
                data_proc <= 1'b1;
            end
            else begin 
                single_transf <= 1'b1;
            end
        end
        else if(op0 == 1'b1) begin 
            if(op1 == 1'b0) begin 
                branch <= 1'b1;
            end
        end
    end
    
    else if(cond == 4'b1111) begin
        uncond <= 1'b1;
    end

    else begin 
        data_proc     <= 1'b0;
        single_transf <= 1'b0;
        uncond <= 1'b0;
        branch <= 1'b0;
    end

 endmodule

