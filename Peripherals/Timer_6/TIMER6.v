
`define TIM6_CR1  4'h0
`define TIM6_DIER 4'h1
`define TIM6_SR   4'h2
`define TIM6_EGR  4'h3
`define TIM6_CNT  4'h4
`define TIM6_PSC  4'h5
`define TIM6_ARR  4'h6
`define TIM6_NONE 4'h7


module TIMER6(
    input wire clk,
    input wire rst,
    
    input wire [ 3:0] ld_tim6_reg,  // Loads TIM6 Register
    input wire [31:0] data_reg,     // Data to write in the TIM6 Registers
    
    input  wire ISR_rst,
    output wire tim6_uif       // Interrupt Rotine Update Event Flag
    );



// _______________________________________________________________
// ***************************************************************

// ===============================================================
            /* <<<< TIMER 6 REGISTERS >>>> */

// Control Signals 
wire tim6_opm;    // Timer 6 One pulse Moduler   
wire tim6_uev;    // Update Event Flag
reg ant_tim6_uev; // Last Update Event Flag
wire i_UIF;       // Interrupt Update Event Flag      
 

// ===============================================================
         /* <<<< TIMER 6 LOAD AND RESETS REGISTERS >>>> */    

// ......................................
// LOAD Registers Condition:
wire tim6_ld_cr1;   
wire tim6_ld_dier;
wire tim6_ld_sr;
wire tim6_ld_egr;
wire tim6_ld_psc;
wire tim6_ld_arr;
wire tim6_ld_cnt;


assign tim6_ld_cr1  = (ld_tim6_reg == `TIM6_CR1) | tim6_opm;
assign tim6_ld_dier =  ld_tim6_reg == `TIM6_DIER;
assign tim6_ld_sr   = (ld_tim6_reg == `TIM6_SR)  | i_UIF & !ant_tim6_uev;
assign tim6_ld_egr  =  ld_tim6_reg == `TIM6_EGR;
assign tim6_ld_psc  =  ld_tim6_reg == `TIM6_PSC;
assign tim6_ld_arr  =  ld_tim6_reg == `TIM6_ARR;
assign tim6_ld_cnt  =  ld_tim6_reg == `TIM6_CNT;
// ......................................
// RESET Registers Conditions:

wire rst_sr;
wire rst_egr;
wire rst_cnt;

assign  rst_sr  = rst | ISR_rst;
assign  rst_egr = (ld_tim6_reg != `TIM6_EGR) | rst;
assign  rst_cnt = rst | tim6_opm;


// ===============================================================
           /* <<<< TIMER 6 REGISTERS MODULES >>>> */    

// ......................................
// Register TIM6_CR1

wire tim6_CEN;  // Enable Counter
wire tim6_UDIS; // Enable Update Event
wire tim6_URS;  // Change Interrupt mode
wire tim6_OPM;  // One Pulse Moduler
wire tim6_ARPE; // Enable Auto-Reload

wire i_tim6_CEN;  // Input Enable Counter
wire i_tim6_UDIS; // Input Enable Update Event
wire i_tim6_URS;  // Input Change Interrupt mode
wire i_tim6_OPM;  // Input One Pulse Moduler
wire i_tim6_ARPE; // Input Enable Auto-Reload

assign i_tim6_CEN  = (data_reg[0] & !tim6_opm); 
assign i_tim6_UDIS = (data_reg[1] & !tim6_opm) | (tim6_UDIS & tim6_opm); 
assign i_tim6_URS  = (data_reg[2] & !tim6_opm) | ( tim6_URS & tim6_opm); 
assign i_tim6_OPM  = (data_reg[3] & !tim6_opm) | ( tim6_OPM & tim6_opm); 
assign i_tim6_ARPE = (data_reg[7] & !tim6_opm) | (tim6_ARPE & tim6_opm); 


tim6_CR1 TIM6_CR1(
    .rst(rst),
    .ld_cr1(tim6_ld_cr1),

    .i_tim6_CEN ( i_tim6_CEN),
    .i_tim6_UDIS(i_tim6_UDIS),
    .i_tim6_URS ( i_tim6_URS),
    .i_tim6_OPM ( i_tim6_OPM),
    .i_tim6_ARPE(i_tim6_ARPE),

    .o_tim6_cr1({
        tim6_ARPE,
        tim6_OPM,
        tim6_URS,
        tim6_UDIS,
        tim6_CEN
    })
);


// ......................................
// Register TIM6_DIER

wire tim6_uie; // Enable Update Event Interrupt

tim6_DIER TIM6_DIER(
    .rst(rst),
    .ld_dier(tim6_ld_dier),
    .i_uie(data_reg[0]),
    .o_uie(tim6_uie)
);

// ......................................
// Register TIM6_SR

//wire tim6_uif; // Update Event Interrupt Flag
wire i_uif;

assign i_uif = data_reg[0] | i_UIF;
tim6_SR TIM6_SR(
    .rst(rst_sr),
    .ld_sr(tim6_ld_sr),
    .i_uif(data_reg[0]),
    .o_uif(tim6_uif)
);

// ......................................
// Register TIM6_EGR

wire tim6_ug; // Software Update Event

tim6_EGR TIM6_EGR(
    .rst(rst_egr),
    .ld_egr(tim6_ld_egr),
    .i_ug(data_reg[0]),
    .o_ug(tim6_ug)
);

// ......................................
// Buffer Prescaler

wire [15:0] tim6_bPSC; // Prescaler Buffer Register

tim6_PSC TIM6_PSC(
    .rst(rst),
    .ld_bpsc(tim6_ld_psc),
    .i_bpsc(data_reg[15:0]),
    .o_bpsc(tim6_bPSC)
);

// ......................................
// Buffer Auto Reload

wire [15:0] tim6_bARR; // Auto-reload Buffer Register

tim6_ARR TIM6_ARR(
    .rst(rst),
    .ld_barr(tim6_ld_arr),
    .i_barr(data_reg[15:0]),
    .o_barr(tim6_bARR)
);



// ===============================================================
        /* <<<< TIMER 6 UPDATE EVENT SHADOW REGISTERS >>>> */    

// ......................................
// Shadow Auto Reload Register

wire [15:0] sh_ARR;
wire ld_sh_arr;

tim6_ShadowREG TIM6_SH_ARR(
    .rst(rst),
    .ld_sh_reg(ld_sh_arr),
    .i_breg(tim6_bARR),
    .sh_reg(sh_ARR)
);


// ......................................
// Shadow Prescaler Register

wire [15:0] sh_PSC;
wire ld_sh_psc;

tim6_ShadowREG TIM6_SH_PSC(
    .rst(rst),
    .ld_sh_reg(ld_sh_psc),
    .i_breg(tim6_bPSC),
    .sh_reg(sh_PSC)
);
// _______________________________________________________________
// ***************************************************************

// ===============================================================
            /* <<<< TIMER 6 COUNTERS >>>> */

// ......................................
// Prescaler Counter

wire tim6_psc_clk; // Prescaler Clock Counter
wire tim6_cnt_clk; // Timer 6 clock Counter

// Prescaler Clock Generator:
assign tim6_psc_clk = clk & tim6_CEN;

PSC_counter PSC_CNT(
    .clk(tim6_psc_clk),
    .rst(rst),
    .psc_reg(sh_PSC),
    .tim_clk(tim6_cnt_clk)
);

// ......................................
// Timer 6 Counter

wire [15:0]tim6_bCNT;
wire tim6_cnt_ov;

tim6_CNT TIM6_CNT (
    .clk(tim6_cnt_clk),
    .rst(rst),
    .ld_cnt(tim6_ld_cnt),
    .tim6_arr(sh_ARR),
    .i_data_cnt(data_reg[15:0]),
    .o_tim6_cnt(tim6_bCNT),
    .cnt_ov(tim6_cnt_ov)
);

// _______________________________________________________________
// ***************************************************************

// ===============================================================
            /* <<<< TIMER 6 CONTROL SIGNALS >>>> */

// Update Event: 
assign tim6_uev = (tim6_cnt_ov & !ant_tim6_uev & tim6_CEN | tim6_ug ) & !tim6_UDIS;

// One Pulse Moduler:
assign tim6_opm = tim6_uev & tim6_OPM;

// Interrupt Rotine:
assign i_UIF = tim6_uie &( tim6_uif | tim6_uev & ( !tim6_URS | (tim6_URS & !tim6_ug) ) );

// Reload Shadows Registers:
assign ld_sh_psc = tim6_uev;
assign ld_sh_arr = (tim6_uev & tim6_ARPE) | ((sh_ARR != tim6_bARR) & !tim6_ARPE & clk) ; 



always @ (negedge tim6_cnt_clk or posedge rst)begin
    if (rst) begin
        ant_tim6_uev <= 0;
    end
    else begin
        ant_tim6_uev <= tim6_uev;
    end
end

endmodule
