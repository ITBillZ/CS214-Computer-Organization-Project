`timescale 1ns / 1ps

module music(clk, rst, musiccs, en, music_data, beep);
input clk, rst;

input musiccs;
input [31:0] music_data; 
input en;

output beep;

wire [6:0] cnt;
wire [4:0] music;
wire [31:0] div;
wire work;
wire [6:0] count;

assign work = rst || en;

music_ctrl ctrl(
    .clk(clk),
    .rst(work),
    .cnt(cnt),
    .tot(count)
);

// music_mem mem(
//     .clk(clk),
//     .rst(rst),
//     .cnt(cnt),
    
//     .music(music)
// );

music_mem_plus mem_plus(
    .clk(clk),
    .rst(rst),
    .cnt(cnt),
    .note(music_data),
    .musiccs(musiccs),
    
    .music(music),
    .count(count)
);

music_pwm pwm(
    .clk(clk),
    .rst(work),
    .music(music),
    
    .pwm(div)
);

music_generate flow(
    .clk(clk),
    .rst(work),
    .pwm(div),
    
    .beep(beep)
);

endmodule