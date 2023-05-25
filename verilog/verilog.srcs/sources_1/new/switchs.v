`timescale 1ns / 1ps
//`include "param.v"
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 2022/05/29 18:27:56
// Design Name: 
// Module Name: switchs
//////////////////////////////////////////////////////////////////////////////////

module switchs(switclk, switrst, switchread, switchcs,switchaddr, switchrdata, switch_i);
    input switclk;			        //  时钟信号
    input switrst;			        //  复位信号
    input switchcs;			        //从memorio来的switch片�?�信�?  !!!!!!!!!!!!!!!!!
    input[1:0] switchaddr;		    //  到switch模块的地�?低端  !!!!!!!!!!!!!!!
    input [2:0] switchread;			    //  ! 读信号，3�?
    output reg [15:0] switchrdata;	    //  送到CPU的拨码开关�?�注意数据�?�线只有16�?
    input [23:0] switch_i;		    //  从板上读�?24位开关数�?

    always@(negedge switclk or posedge switrst) begin
        if(switrst) begin
            switchrdata <= 0;
        end
        // !modify
		else if(switchcs && switchread) begin
            // word OR half word
            if (switchread == 3'b100 || switchread == 3'b010) begin
                if(switchaddr==2'b00)
				    switchrdata[15:0] <= switch_i[15:0];
                else if (switchaddr == 2'b10)
                    switchrdata[15:0] <={ 8'h00, switch_i[23:16] };
                else 
                    switchrdata <= switchrdata;
            end 

            // byte
            else if (switchread == 3'b001) begin
                if(switchaddr==2'b00)
                    switchrdata[15:0] <= { 8'h00, switch_i[7:0] };   // lower 8 bits 
                else if (switchaddr==2'b01)
                    switchrdata[15:0] <={ 8'h00, switch_i[15:8] }; // midden 8 bits
                else if(switchaddr==2'b10)
                    switchrdata[15:0] <={ 8'h00, switch_i[23:16] };// upper 8 bits 
                else   
                    switchrdata <= switchrdata;
            end

		    else 
                switchrdata <= switchrdata;
        end
    end
endmodule
