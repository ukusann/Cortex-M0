
`define TIM1_CR1   4'h0
`define TIM1_DIER  4'h1
`define TIM1_SR    4'h2
`define TIM1_EGR   4'h3
`define TIM1_CNT   4'h4
`define TIM1_PSC   4'h5
`define TIM1_ARR   4'h6
`define TIM1_CCMR1 4'h7
`define TIM1_CCER  4'h8
`define TIM1_CCR1  4'h9
`define TIM1_NONE  4'ha



module TIMER1(
    input wire clk,
    input wire rst,
    
    input wire [ 4:0] ld_tim1_reg,  // Loads TIM1 Register
    input wire [31:0] data_reg,     // Data to write in the TIM1 Registers
    
    input  wire uif_rst,
    input  wire cc1if_rst,
    
    output wire tim1_CC1P,         // Compare 1 Output Pin
    output wire tim1_CC1NP,        // Compare 1 Complementary Output Pin 
    
    output wire tim1_uif,           // Interrupt Rotine Update Event Flag
    output wire tim1_cc1if          // Interrupt Rotine PWM Period Flag
    );




// _______________________________________________________________
// ***************************************************************

// ===============================================================
            /* <<<< TIMER 1 REGISTERS >>>> */

// Control Signals 
wire tim1_opm;      // Timer 1 One pulse Moduler   
wire tim1_uev;      // Update Event Flag
reg ant_tim1_uev;   // Last Update Event Flag
reg ant_tim1_cc1ev; // Last Compare Event Flag
wire i_UIF;         // Interrupt Update Event Flag      
 

// ===============================================================
         /* <<<< TIMER 1 LOAD AND RESETS REGISTERS >>>> */    

// ......................................
// LOAD Registers Condition:
wire tim1_ld_cr1;   
wire tim1_ld_dier;
wire tim1_ld_sr_uif;
wire tim1_ld_sr_cc1if;
wire tim1_ld_egr;
wire tim1_ld_psc;
wire tim1_ld_arr;
wire tim1_ld_cnt;
wire tim1_ld_ccmr1;
wire tim1_ld_ccr1;

assign tim1_ld_cr1      = (ld_tim1_reg == `TIM1_CR1) | tim1_opm;
assign tim1_ld_dier     =  ld_tim1_reg == `TIM1_DIER;
assign tim1_ld_sr_uif   = (ld_tim1_reg == `TIM1_SR)  | (i_UIF) & !ant_tim1_uev;
assign tim1_ld_sr_cc1if = (ld_tim1_reg == `TIM1_SR)  | (i_CC1IF) & !ant_tim1_cc1ev;
assign tim1_ld_egr      =  ld_tim1_reg == `TIM1_EGR;
assign tim1_ld_psc      =  ld_tim1_reg == `TIM1_PSC;
assign tim1_ld_arr      =  ld_tim1_reg == `TIM1_ARR;
assign tim1_ld_cnt      =  ld_tim1_reg == `TIM1_CNT;
assign tim1_ld_ccmr1    =  ld_tim1_reg == `TIM1_CCMR1;
assign tim1_ld_ccer     =  ld_tim1_reg == `TIM1_CCER;
assign tim1_ld_ccr1     =  ld_tim1_reg == `TIM1_CCR1;
// ......................................
// RESET Registers Conditions:

wire rst_egr;
wire rst_cnt;

assign  rst_egr = (ld_tim1_reg != `TIM1_EGR) | rst;
assign  rst_cnt = rst | tim1_opm;



// ===============================================================
           /* <<<< TIMER 1 REGISTERS MODULES >>>> */    


// ......................................
// Register TIM1_CR1

wire tim1_CEN;       // Enable Counter
wire tim1_UDIS;      // Enable Update Event
wire tim1_URS;       // Change Interrupt mode
wire tim1_OPM;       // One Pulse Moduler
wire tim1_DIR;       // Diretion of the Counter
wire [1:0] tim1_CMS; // Counter Mode
wire tim1_ARPE;      // Enable Auto-Reload

wire i_tim1_CEN;       // Input Enable Counter
wire i_tim1_UDIS;      // Input Enable Update Event
wire i_tim1_URS;       // Input Change Interrupt mode
wire i_tim1_OPM;       // Input One Pulse Moduler
wire i_tim1_DIR;       // Input Diretion of the Counter
wire [1:0] i_tim1_CMS; // Input Counter Mode
wire i_tim1_ARPE;      // Input Enable Auto-Reload

assign i_tim1_CEN  = (data_reg[0]   & !tim1_opm); 
assign i_tim1_UDIS = (data_reg[1]   & !tim1_opm) | (tim1_UDIS & tim1_opm); 
assign i_tim1_URS  = (data_reg[2]   & !tim1_opm) | ( tim1_URS & tim1_opm); 
assign i_tim1_OPM  = (data_reg[3]   & !tim1_opm) | ( tim1_OPM & tim1_opm); 
assign i_tim1_DIR  = (data_reg[4]   & !tim1_opm) | ( tim1_DIR & tim1_opm); 
assign i_tim1_CMS  = (data_reg[6:5] & !tim1_opm) | ( tim1_CMS & {2{tim1_opm}}); 
assign i_tim1_ARPE = (data_reg[7]   & !tim1_opm) | (tim1_ARPE & tim1_opm); 


tim1_CR1 TIM1_CR1(
    .rst(rst),
    .ld_cr1(tim1_ld_cr1),

    .i_tim1_CEN ( i_tim1_CEN),
    .i_tim1_UDIS(i_tim1_UDIS),
    .i_tim1_URS ( i_tim1_URS),
    .i_tim1_OPM ( i_tim1_OPM),
    .i_tim1_DIR ( i_tim1_DIR),
    .i_tim1_CMS ( i_tim1_CMS),
    .i_tim1_ARPE(i_tim1_ARPE),

    .o_tim1_cr1({
        tim1_ARPE,
        tim1_CMS,
        tim1_DIR,
        tim1_OPM,
        tim1_URS,
        tim1_UDIS,
        tim1_CEN
    })
);


// ......................................
// Register TIM1_DIER

wire tim1_uie;     // Enable Update Event Interrupt
wire tim1_cc1ie;   // Enable PWM Period Interrupt

tim1_DIER TIM1_DIER(
    .rst(rst),
    .ld_dier(tim1_ld_dier),
    .i_uie(data_reg[0]),
    .i_cc1ie(data_reg[1]),
    .o_uie(tim1_uie),
    .o_cc1ie(tim1_cc1ie)
);

// ......................................
// Register TIM1_SR

wire i_uif;
wire i_cc1if;

assign i_uif = data_reg[0] | i_UIF;
assign i_cc1if = data_reg[1] | i_CC1IF;

tim1_SR TIM1_SR(
    .ld_sr_uif(tim1_ld_sr_uif),
    .ld_sr_cc1if(tim1_ld_sr_cc1if),
    .rst_uif(uif_rst | rst),
    .rst_cc1if(cc1if_rst | rst),
    .i_uif(i_uif),
    .i_cc1if(i_cc1if),
    .o_uif(tim1_uif),
    .o_cc1if(tim1_cc1if)
);


// ......................................
// Register TIM1_EGR

wire tim1_ug;   // Software Update Event
wire tim1_cc1g; // Software PWM Period Event

tim1_EGR TIM1_EGR(
    .rst(rst_egr),
    .ld_egr(tim1_ld_egr),
    .i_ug(data_reg[0]),
    .i_cc1g(data_reg[1]),
    .o_ug(tim1_ug),
    .o_cc1g(tim1_cc1g)
);


// ......................................
// Buffer Prescaler

wire [15:0] tim1_bPSC; // Prescaler Buffer Register

tim1_PSC TIM1_PSC(
    .rst(rst),
    .ld_bpsc(tim1_ld_psc),
    .i_bpsc(data_reg[15:0]),
    .o_bpsc(tim1_bPSC)
);

// ......................................
// Buffer Auto Reload

wire [15:0] tim1_bARR; // Auto-reload Buffer Register

tim1_ARR TIM1_ARR(
    .rst(rst),
    .ld_barr(tim1_ld_arr),
    .i_barr(data_reg[15:0]),
    .o_barr(tim1_bARR)
);

// ......................................
// Control Compare Register 

wire [1:0] tim1_ccmr1;

tim1_CCMR1 TIM1_CCMR1(
    .rst(rst),
    .ld_ccmr1(tim1_ld_ccmr1),
    .i_oc1m(data_reg[1:0]),
    .o_oc1m(tim1_ccmr1)
);

// ......................................
// Compare Output Register Enable 

wire tim1_cc1E;  // Enable Compare 1 Output
wire tim1_cc1P;  // Compare 1 output polatity   
wire tim1_cc1NE; // Enable Compare 1 Complementary Output 
wire tim1_cc1NP; // Compare 1 Complementary Output polatity

tim1_CCER TIM1_CCER(
    .rst(rst),
    .ld_ccer(tim1_ld_ccer),
    .i_ccer(data_reg[3:0]),
    .o_cc1E(tim1_cc1E),
    .o_cc1P(tim1_cc1P),
    .o_cc1NE(tim1_cc1NE),
    .o_cc1NP(tim1_cc1NP)
);

// ......................................
// Buffer Compare Output 

wire [15:0]tim1_bCCR1;

tim1_CCR1 TIM1_CCR1(
    .rst(rst),
    .ld_ccr1(tim1_ld_ccr1),
    .i_ccr1(data_reg[15:0]),
    .o_ccr1(tim1_bCCR1)
);



// ===============================================================
        /* <<<< TIMER 1 UPDATE EVENT SHADOW REGISTERS >>>> */    

// ......................................
// Shadow Auto Reload Register

wire [15:0] sh_ARR;
wire ld_sh_arr;

tim1_ShadowREG TIM1_SH_ARR(
    .rst(rst),
    .ld_sh_reg(ld_sh_arr),
    .i_breg(tim1_bARR),
    .sh_reg(sh_ARR)
);


// ......................................
// Shadow Prescaler Register

wire [15:0] sh_PSC;
wire ld_sh_psc;

tim1_ShadowREG TIM1_SH_PSC(
    .rst(rst),
    .ld_sh_reg(ld_sh_psc),
    .i_breg(tim1_bPSC),
    .sh_reg(sh_PSC)
);



// _______________________________________________________________
// ***************************************************************

// ===============================================================
            /* <<<< TIMER 1 COUNTERS >>>> */

// ......................................
// Prescaler Counter

wire tim1_psc_clk; // Prescaler Clock Counter
wire tim1_cnt_clk; // Timer 1 clock Counter

// Prescaler Clock Generator:
assign tim1_psc_clk = clk & tim1_CEN;

PSC_counter PSC_CNT(
    .clk(tim1_psc_clk),
    .rst(rst),
    .psc_reg(sh_PSC),
    .tim_clk(tim1_cnt_clk)
);

// ......................................
// Timer 6 Counter

wire [15:0]tim1_bCNT;
wire tim1_cnt_ov;
wire tim1_cnt_uv;
wire tim1_cnt_dir;

tim1_CNT TIM1_CNT (
    .clk(tim1_cnt_clk),
    .rst(rst),
    .timer_en(tim1_CEN),
    .ld_cnt(tim1_ld_cnt),
    .DIR(tim1_DIR),
    .dir_mode(tim1_CMS[1] | tim1_CMS[0]),
    .tim1_arr(sh_ARR),
    .i_data_cnt(data_reg[15:0]),
    .o_tim1_cnt(tim1_bCNT),
    .dir(tim1_cnt_dir),
    .cnt_ov(tim1_cnt_ov),
    .cnt_uv(tim1_cnt_uv)
);


// _______________________________________________________________
// ***************************************************************

// ===============================================================
            /* <<<< TIMER 1 PWM MODULER >>>> */

wire tg_tim1_pwm, eq_comp;
wire tim1_pwm;

wire tim1_cc1ev;

// Toggle PWM Module:
ToggleModule TogglePWM(
    .rst(rst),
    .en_toggle(eq_comp),
    .i_signal(tim1_pwm),
    .o_toggle_signal(tg_tim1_pwm)
);


// Compare Counter == Compare Register:
assign eq_comp = tim1_bCNT == tim1_bCCR1;

// Pulse Wave Moduler (PWM) 3 modes:
assign tim1_pwm = !tim1_ccmr1[1] &  tim1_ccmr1[0] & tg_tim1_pwm | // Toggle Mode
                   tim1_ccmr1[1] & !tim1_ccmr1[0] & eq_comp |     // Pulse Mode (Always off)
                   tim1_ccmr1[1] &  tim1_ccmr1[0] & !eq_comp;     // Pulse Mode (Always on)

// Compare Equal Mode Event:
assign tim1_cc1ev = !ant_tim1_cc1ev & eq_comp & 
                    (tim1_cnt_dir & tim1_CMS[1] | !tim1_cnt_dir & tim1_CMS[0]);

// Interrupt Rotine
assign i_CC1IF = tim1_cc1ie & ( tim1_cc1if | tim1_cc1ev | tim1_cc1g); 


// Compare 1 Output Pin:
assign tim1_CC1P  = tim1_cc1E & (tim1_pwm & !tim1_cc1P | ~tim1_pwm & tim1_cc1P);

// Compare 1 Complementary Output Pin:
assign tim1_CC1NP = tim1_cc1NE & (~tim1_pwm & !tim1_cc1NP | tim1_pwm & tim1_cc1NP);  
    

// _______________________________________________________________
// ***************************************************************

// ===============================================================
            /* <<<< TIMER 1 CONTROL SIGNALS >>>> */

// Update Event: 
assign tim1_uev = ((tim1_cnt_ov | tim1_cnt_uv) & !ant_tim1_uev & tim1_CEN | tim1_ug ) & !tim1_UDIS;
                    
// One Pulse Moduler:
assign tim1_opm = tim1_uev & tim1_OPM;

// Interrupt Rotine:
assign i_UIF = tim1_uie &( tim1_uif | tim1_uev & ( !tim1_URS | (tim1_URS & !tim1_ug) ) );

// Reload Shadows Registers:
assign ld_sh_psc = tim1_uev;
assign ld_sh_arr = (tim1_uev & tim1_ARPE) | ((sh_ARR != tim1_bARR) & !tim1_ARPE & clk) ; 


// ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
// Pulse Interrupt Events:

always @ (negedge tim1_cnt_clk or posedge rst)begin
    if (rst) begin
        ant_tim1_uev <= 0;
        ant_tim1_cc1ev <= 0;
    end
    else begin
        ant_tim1_uev <= tim1_uev;
        ant_tim1_cc1ev <= tim1_cc1ev;
    end
end


endmodule