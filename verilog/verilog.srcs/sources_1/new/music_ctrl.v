`timescale 1ns / 1ps

module music_ctrl(clk,rst,cnt, tot);
input clk, rst;// rst active low
input [6:0]tot;
output reg [6:0] cnt;

parameter period = 25000000; // every 1/4 second, period up,speed down
reg        [25:0] count;
wire                flag;
always @(posedge clk, negedge rst) begin
    if(~rst)
        count <= 26'b0;
    else begin
        if(count == period-1'b1) 
            count <= 26'b0;
        else
            count <= count + 1'b1; 
    end
end

assign flag = (count == period - 1'b1);
always @(posedge clk, negedge rst) begin
    if(~rst)
        cnt <= 7'b0;
    else begin
        if(cnt == tot - 1'b1) begin
              cnt <= 7'b0;
        end
        else begin
        if(flag) 
            cnt <= cnt + 1'b1;
        else
            cnt <= cnt;
        end
    end
end


endmodule