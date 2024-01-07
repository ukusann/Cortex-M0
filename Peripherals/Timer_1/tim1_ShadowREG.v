module tim1_ShadowREG(
    input wire rst,

    input wire ld_sh_reg,       // Load Shadow Registers    
    input wire [15:0] i_breg,   // Input Buffer Register

    output wire [15:0] sh_reg   // Output Shadow Register
    );

reg [15:0] sh_REG; // Shadow Register

assign sh_reg = sh_REG;

always @(posedge ld_sh_reg or posedge rst) begin
    if (rst) begin
        sh_REG <= 0; 
    end
    else if (ld_sh_reg) begin 
       sh_REG <= i_breg; 
    end 
end


endmodule