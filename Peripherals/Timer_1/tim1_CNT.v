

module tim1_CNT(
    input wire clk,
    input wire rst,
    
    input wire timer_en,
    input wire ld_cnt,
    input wire DIR,
    input wire dir_mode,
    input wire [15:0] tim1_arr,
    input wire [15:0] i_data_cnt,
    
    output wire [15:0] o_tim1_cnt,
    output wire dir,
    output wire cnt_ov,
    output wire cnt_uv
    
    );

wire en_dir_toggle; 
wire tg_dir;
assign en_dir_toggle = timer_en & (cnt_uv| cnt_ov);

ToggleModule ToggleDIR(
    .rst(rst),
    .en_toggle(en_dir_toggle),
    .i_signal(dir),
    .o_toggle_signal(tg_dir)
);

wire LD_CNT;
reg  [15:0] tim1_bCNT;

// Load Counter:
assign LD_CNT = clk | ld_cnt;

// Counter Direction:
assign dir = DIR & !dir_mode | dir_mode & tg_dir;

// Timer 6 Overflow Condition:
assign cnt_ov = (tim1_arr == tim1_bCNT) & (dir | dir_mode);
assign cnt_uv = (0 == tim1_bCNT) & (!dir | dir_mode);

// Timer 6 Counter UP/DOWN: 
assign o_tim1_cnt = {16{ timer_en }} & ((tim1_bCNT +1) & {16{ !cnt_ov & dir }}  |
                    (tim1_bCNT -1) & {16{ !cnt_uv & !dir }} | (tim1_arr) & {16{ cnt_uv & !dir_mode }});                      

always @ (posedge LD_CNT or posedge rst) begin
    if (rst) begin
        tim1_bCNT <= 16'h0000;
    end
    else begin
        tim1_bCNT <= (o_tim1_cnt & {16{ !ld_cnt }}) | (i_data_cnt & {16{ ld_cnt }}); 
    end

end

endmodule
