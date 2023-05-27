`timescale 1ns / 1ps

module music(clk, rst, beep);
input clk, rst;

output beep;

wire [5:0] cnt;
wire [4:0] music;
wire [31:0] div;

music_ctrl ctrl(
    .clk(clk),
    .rst(rst),

    .cnt(cnt)
);

music_mem mem(
    .clk(clk),
    .rst(rst),
    .cnt(cnt),
    
    .music(music)
);

music_pwm pwm(
    .clk(clk),
    .rst(rst),
    .music(music),
    
    .pwm(div)
);

music_generate flow(
    .clk(clk),
    .rst(rst),
    .pwm(div),
    
    .beep(beep)
);

endmodule