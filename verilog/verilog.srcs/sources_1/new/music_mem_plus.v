`timescale 1ns / 1ps

module music_mem_plus(clk, rst, cnt, music, musiccs, note,count);
input clk,rst;
input [6:0] cnt;
input [31:0] note;
input musiccs;

output reg [4:0] music;
output reg[6:0] count;
// do re mi fa so la si (low)
// do re mi fa so la si (mid)
// do re mi fa so la si (high)
reg[4:0] music_score[127:0];
reg flag;

always @(posedge musiccs) begin
            flag <= 1'b1;
end

always @(posedge clk, negedge rst) begin
    if(rst) begin
            music_score[0] <= 5'b0;
            music_score[1] <= 5'b0;
            music_score[2] <= 5'b0;
            music_score[3] <= 5'b0;
            music_score[4] <= 5'b0;
            music_score[5] <= 5'b0;
            music_score[6] <= 5'b0;
            music_score[7] <= 5'b0;
            music_score[8] <= 5'b0;
            music_score[9] <= 5'b0;
            music_score[10] <=5'b0;
            music_score[11] <=5'b0;
            music_score[12] <=5'b0;
            music_score[13] <=5'b0;
            music_score[14] <=5'b0;
            music_score[15] <=5'b0;
            music_score[16] <=5'b0;
            music_score[17] <=5'b0;
            music_score[18] <=5'b0;
            music_score[19] <=5'b0;
            music_score[20] <=5'b0;
            music_score[21] <=5'b0;
            music_score[22] <=5'b0;
            music_score[23] <=5'b0;
            music_score[24] <=5'b0;
            music_score[25] <=5'b0;
            music_score[26] <=5'b0;
            music_score[27] <=5'b0;
            music_score[28] <=5'b0;
            music_score[29] <=5'b0;
            music_score[30] <=5'b0;
            music_score[31] <=5'b0;

            music_score[32] <= 5'b0;
            music_score[33] <= 5'b0;
            music_score[34] <= 5'b0;
            music_score[35] <= 5'b0;
            music_score[36] <= 5'b0;
            music_score[37] <= 5'b0;
            music_score[38] <= 5'b0;
            music_score[39] <= 5'b0;
            music_score[40] <= 5'b0;
            music_score[41] <= 5'b0;
            music_score[42] <=5'b0;
            music_score[43] <=5'b0;
            music_score[44] <=5'b0;
            music_score[45] <=5'b0;
            music_score[46] <=5'b0;
            music_score[47] <=5'b0;
            music_score[48] <=5'b0;
            music_score[49] <=5'b0;
            music_score[50] <=5'b0;
            music_score[51] <=5'b0;
            music_score[52] <=5'b0;
            music_score[53] <=5'b0;
            music_score[54] <=5'b0;
            music_score[55] <=5'b0;
            music_score[56] <=5'b0;
            music_score[57] <=5'b0;
            music_score[58] <=5'b0;
            music_score[59] <=5'b0;
            music_score[60] <=5'b0;
            music_score[61] <=5'b0;
            music_score[62] <=5'b0;
            music_score[63] <=5'b0;

            music_score[64] <= 5'b0;
            music_score[65] <= 5'b0;
            music_score[66] <= 5'b0;
            music_score[67] <= 5'b0;
            music_score[68] <= 5'b0;
            music_score[69] <= 5'b0;
            music_score[70] <= 5'b0;
            music_score[71] <= 5'b0;
            music_score[72] <= 5'b0;
            music_score[73] <= 5'b0;
            music_score[74] <=5'b0;
            music_score[75] <=5'b0;
            music_score[76] <=5'b0;
            music_score[77] <=5'b0;
            music_score[78] <=5'b0;
            music_score[79] <=5'b0;
            music_score[80] <=5'b0;
            music_score[81] <=5'b0;
            music_score[82] <=5'b0;
            music_score[83] <=5'b0;
            music_score[84] <=5'b0;
            music_score[85] <=5'b0;
            music_score[86] <=5'b0;
            music_score[87] <=5'b0;
            music_score[88] <=5'b0;
            music_score[89] <=5'b0;
            music_score[90] <=5'b0;
            music_score[91] <=5'b0;
            music_score[92] <=5'b0;
            music_score[93] <=5'b0;
            music_score[94] <=5'b0;
            music_score[95] <=5'b0;

            music_score[96] <= 5'b0;
            music_score[97] <= 5'b0;
            music_score[98] <= 5'b0;
            music_score[99] <= 5'b0;
            music_score[100] <= 5'b0;
            music_score[101] <= 5'b0;
            music_score[102] <= 5'b0;
            music_score[103] <= 5'b0;
            music_score[104] <= 5'b0;
            music_score[105] <= 5'b0;
            music_score[106] <=5'b0;
            music_score[107] <=5'b0;
            music_score[108] <=5'b0;
            music_score[109] <=5'b0;
            music_score[110] <=5'b0;
            music_score[111] <=5'b0;
            music_score[112] <=5'b0;
            music_score[113] <=5'b0;
            music_score[114] <=5'b0;
            music_score[115] <=5'b0;
            music_score[116] <=5'b0;
            music_score[117] <=5'b0;
            music_score[118] <=5'b0;
            music_score[119] <=5'b0;
            music_score[120] <=5'b0;
            music_score[121] <=5'b0;
            music_score[122] <=5'b0;
            music_score[123] <=5'b0;
            music_score[124] <=5'b0;
            music_score[125] <=5'b0;
            music_score[126] <=5'b0;
            music_score[127] <=5'b0;

            count <= 7'b0;
            flag <= 1'b0;
    end
    else if(musiccs && flag) begin
            if(note[7:0] != 0) begin
                music_score[count] = note[4:0];
                count = count + 1;
            end 
            if(note[15:8] != 0) begin
                music_score[count] = note[12:8];
                count = count + 1;
            end
            if(note[23:16] != 0) begin
                music_score[count] = note[20:16];
                count = count + 1;
            end
            if(note[31:24] != 0) begin
                music_score[count] = note[28:24];
                count = count + 1;
            end
            
            flag <= 1'b0;
    end
end  

always @(posedge clk, negedge rst) begin
    if(rst)
        music <= 5'b0;
    else 
        music <= music_score[cnt];
end

endmodule