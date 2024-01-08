module NVIC (
  input wire clk,
  input wire rst,
  input wire nvic_en,
  input wire [7:0] interrupt_set_enable,     // ISER: Interrupt Set-Enable Register
  input wire [7:0] interrupt_clr_enable,     // ICER: Interrupt Clear-Enable Register
  input wire [7:0] interrupt_set_pending,    // ISPR: Interrupt Set-Pending Register
  input wire [7:0] interrupt_clr_pending,    // ICPR: Interrupt Clear-Pending Register
  input wire [31:0] interrupt_priority_0,     // IPR0: Interrupt Priority Register 0
  output wire [7:0] interrupt_active_out      // Active interrupt (32 interrupts -> 8 bits to represent)
);

  // Internal signals
  wire [7:0] interrupts_enabled;   // Interrupts enabled
  wire [7:0] interrupts_pending;   // Interrupts that are pending
  wire [1:0] priority_int_0;        // Interrupt 0 priority
  wire [1:0] priority_int_1;        // Interrupt 1 priority
  wire [1:0] priority_int_2;        // Interrupt 2 priority
  reg  [1:0] priority_level;        // Interrupt temp priority level
  reg  [7:0] active_interrupt;      // Active interrupt
  reg  [1:0] highest_priority;      // Saves the highest priority pending interrupt
  reg  [7:0] next_interrupt;        // Saves the next interrupt index
  reg  [7:0] first_pending;         // Saves the first pending interrupt
  reg  [3:0] cnt;
  reg  [7:0] i;
 
  // Initialize
  initial begin
    active_interrupt <= 8'b0;
    highest_priority <= 8'b0;
    priority_level <= 2'b0;
    next_interrupt <= 8'b0;
    first_pending <= 8'b0;
    cnt <= 4'b0;
    i <= 8'd31;
  end

  // Main processing block
  always @(posedge nvic_en or posedge rst) begin
    if (rst) begin
      // Reset values
      active_interrupt <= 8'b0;
      highest_priority <= 8'b0;
    end else begin
      

    // Determine the highest priority pending interrupt
    for (i = 8'd7; i > 8'd0; i = i - 1) begin
      if (interrupts_pending[i]) begin
        first_pending <= i;
        case(i)
         8'd0: priority_level = priority_int_0;
         8'd1: priority_level = priority_int_1;
         8'd2: priority_level = priority_int_2; 
         default: priority_level = 2'b0;
        endcase 
        if(priority_level >= highest_priority) begin
          highest_priority <= priority_level;
          next_interrupt <= i;
        end
      end
    end
    if(next_interrupt == 8'd0)
      next_interrupt = first_pending;

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

  // Interrupt 0 Priority 
  assign priority_int_0 = interrupt_priority_0[7:6];

  // Interrupt 1 Priority
  assign priority_int_1 = interrupt_priority_0[15:14];

  // Interrupt 2 Priority
  assign priority_int_2 = interrupt_priority_0[23:22];


endmodule
