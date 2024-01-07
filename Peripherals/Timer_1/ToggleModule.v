
module ToggleModule(
  input wire rst,
  input wire en_toggle,
  input wire i_signal,
  output wire o_toggle_signal
);
    reg toggle_internal;
    assign o_toggle_signal = toggle_internal;

    always @(posedge en_toggle or posedge rst) begin
        if (rst) begin
            toggle_internal <= 0;
        end
        else begin
            toggle_internal <= ~i_signal; 
        end
    end

endmodule
