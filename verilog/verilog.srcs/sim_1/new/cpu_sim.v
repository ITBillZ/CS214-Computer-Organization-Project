`timescale 1ns / 1ps


module cpu_sim(

    );
    reg fpga_clk;
    reg fpga_rst;
    reg music_play;
    reg [23:0] switch;
    reg en;
    wire [23:0] led;

    defparam CPU.musicplayer.ctrl.period = 10;
    cpu CPU(
        .fpga_clk(fpga_clk),
        .fpga_rst(fpga_rst),
        .switch(switch),
        .start_pg(0),
        .music_play(music_play),
        
        .led(led)
    );

    initial begin
        fpga_clk = 0;
        switch = 0;
    end

    always begin
        forever begin
            #1 fpga_clk <= ~fpga_clk;
        end
    end
    
    always begin
        forever begin
            #10 fpga_rst = 0;
                   music_play = 0;
            #10 fpga_rst = 1;
            #10 fpga_rst = 0;
            #1000 music_play = 1;
            #10 music_play = 0;
            #2000 fpga_rst = 1;
        end
    end
    



endmodule
