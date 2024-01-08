module NVIC (
  input wire clk,
  input wire rst,
  input wire [31:0] interrupt_set_enable,     // ISER: Interrupt Set-Enable Register
  input wire [31:0] interrupt_clr_enable,     // ICER: Interrupt Clear-Enable Register
  input wire [31:0] interrupt_set_pending,    // ISPR: Interrupt Set-Pending Register
  input wire [31:0] interrupt_clr_pending,    // ICPR: Interrupt Clear-Pending Register
  input wire [32:0] interrupt_priority_0,     // IPR0: Interrupt Priority Register 0
  input wire [32:0] interrupt_priority_1,     // IPR1: Interrupt Priority Register 1     
  input wire [32:0] interrupt_priority_2,     // IPR2: Interrupt Priority Register 2
  input wire [32:0] interrupt_priority_3,     // IPR3: Interrupt Priority Register 3
  input wire [32:0] interrupt_priority_4,     // IPR4: Interrupt Priority Register 4
  input wire [32:0] interrupt_priority_5,     // IPR5: Interrupt Priority Register 5
  input wire [32:0] interrupt_priority_6,     // IPR6: Interrupt Priority Register 6
  input wire [32:0] interrupt_priority_7,     // IPR7: Interrupt Priority Register 7
  output wire [7:0] interrupt_active_out      // Active interrupt (32 interrupts -> 8 bits to represent)
);

  // Internal signals
  wire [31:0] interrupts_enabled;   // Interrupts enabled
  wire [31:0] interrupts_pending;   // Interrupts that are pending
  reg  [7:0] active_interrupt;      // Active interrupt
  reg  [1:0] priority_level;        // Each priority field has 3 possible priority levels
  reg  [1:0] highest_priority;      // Saves the highest priority pending interrupt
  reg  [7:0] next_interrupt;        // Saves the next interrupt index
  reg  [3:0] cnt;
  reg  [7:0] i;
 
  // Initialize
  initial begin
    active_interrupt <= 8'b0;
    highest_priority <= 8'b0;
    priority_level <= 2'b0;
    next_interrupt <= 8'b0;
    cnt <= 4'b0;
    i <= 8'd31;
  end

  // Main processing block
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      // Reset values
      active_interrupt <= 8'b0;
      highest_priority <= 8'b0;
    end else begin
      

    // Determine the highest priority pending interrupt
    cnt = 4'd4;
    for (i = 8'd31; i >= 8'd0; i = i - 1) begin
      cnt = cnt - 1;
      if(cnt == 4'd0)
        cnt = 4'd4;
      if (interrupts_pending[i]) begin
      case ((i-cnt)/4)
        0: priority_level = interrupt_priority_0[7 + cnt * 8 -: 2];
        1: priority_level = interrupt_priority_1[7 + cnt * 8 -: 2];
        2: priority_level = interrupt_priority_2[7 + cnt * 8 -: 2];
        3: priority_level = interrupt_priority_3[7 + cnt * 8 -: 2];
        4: priority_level = interrupt_priority_4[7 + cnt * 8 -: 2];
        5: priority_level = interrupt_priority_5[7 + cnt * 8 -: 2];
        6: priority_level = interrupt_priority_6[7 + cnt * 8 -: 2];
        7: priority_level = interrupt_priority_7[7 + cnt * 8 -: 2];
      endcase
        if(priority_level > highest_priority) begin
          highest_priority <= priority_level;
          next_interrupt <= i;
        end
      end
    end

    // Update active interrupts based on pending interrupts and enable bits
    active_interrupt <= next_interrupt & interrupts_enabled;

    end
  end

  // Update interrupts enabled based on external interrupt sources
  assign interrupts_enabled = interrupt_set_enable & ~interrupt_clr_enable;
  
  // Update pending interrupts based on external interrupt sources
  assign interrupts_pending = interrupt_set_pending & ~interrupt_clr_pending; 

  // Update active interrupt
  assign interrupt_active_out = active_interrupt; 
endmodule
