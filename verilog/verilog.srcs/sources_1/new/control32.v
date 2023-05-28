`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////////////////
// Create Date: 2022/05/18 10:28:06
// Design Name: 
// Module Name: control32
// Description: 
// Revision 0.01 - File Created
/////////////////////////////////////////////////////////////////////////////

module control32(Opcode, Function_opcode, Jr, RegDST, ALUSrc, MemtoReg, RegWrite, MemWrite, Branch, nBranch, Jmp, Jal, I_format, Sftmd, ALUOp,MemorIOtoReg,MemRead,IORead,IOWrite,MusicRead,Alu_resultHigh);
    input[5:0]   Opcode;            // 来自IFetch模块的指令高6bit, instruction[31..26]
    input[5:0]   Function_opcode;  	// 来自IFetch模块的指令低6bit, 用于区分r-类型中的指令, instructions[5..0]
    output       Jr;         	 // �?1表明当前指令是jr, �?0表示当前指令不是jr
    output       RegDST;          // �?1表明目的寄存器是rd, 否则目的寄存器是rt
    output       ALUSrc;          // �?1表明第二个操作数（ALU中的Binput）是立即数（beq, bne除外�?, �?0时表示第二个操作数来自寄存器
    output       MemtoReg;       // �?1表明�?要从存储器或I/O读数据到寄存�?
    output       RegWrite;   	  // �?1表明该指令需要写寄存�?
    output       MemWrite;       // �?1表明该指令需要写存储�?
    output       Branch;        // �?1表明是beq指令, �?0时表示不是beq指令
    output       nBranch;       // �?1表明是Bne指令, �?0时表示不是bne指令
    output       Jmp;            // �?1表明是J指令, �?0时表示不是J指令
    output       Jal;            // �?1表明是Jal指令, �?0时表示不是Jal指令
    output       I_format;      // �?1表明该指令是除beq, bne, LW, SW之外的其他I-类型指令
    output       Sftmd;         // �?1表明是移位指�?, �?0表明不是移位指令
    output[1:0]  ALUOp;        // 是R-类型或I_format=1时位1（高bit位）�?1,  beq、bne指令则位0（低bit位）�?1
    output MemorIOtoReg;    // 1 indicates that data needs to be read from memory or I/O to the register
    output MemRead;     // 1 indicates that the instruction needs to read from the memory
    output IORead ;     // 1 indicates I/O read
    output IOWrite;    // 1 indicates I/O write

    output MusicRead; // 1 indicates Music read

    input [21:0] Alu_resultHigh;    // From the execution unit Alu_Result[31..10]
        
    wire R_format;
    wire Lw;
    wire Sw;
    assign Lw=(Opcode==6'b100011)? 1'b1:1'b0;
    assign Sw=(Opcode==6'b101011)?1'b1:1'b0;
    assign Jr =((Opcode==6'b000000)&&(Function_opcode==6'b001000)) ? 1'b1 : 1'b0;
    assign Jal = (Opcode==6'b000011)? 1'b1:1'b0;
    assign Jmp= (Opcode==6'b000010)? 1'b1:1'b0;
    assign R_format=(Opcode==6'b000000)? 1'b1:1'b0;
    assign RegDST = R_format;
    assign I_format = (Opcode[5:3]==3'b001)?1'b1:1'b0;
    assign ALUOp = {(R_format || I_format),(Branch || nBranch)};
    assign Sftmd = (((Function_opcode==6'b000000)||(Function_opcode==6'b000010)
    ||(Function_opcode==6'b000011)||(Function_opcode==6'b000100)
    ||(Function_opcode==6'b000110)||(Function_opcode==6'b000111))
    && R_format)? 1'b1:1'b0;
    assign RegWrite = (R_format || Lw || Jal || I_format) && !(Jr);
    assign Branch = (Opcode==6'b000100)? 1'b1:1'b0;
    assign nBranch = (Opcode==6'b000101)? 1'b1:1'b0;
    assign MemWrite = (Opcode==6'b101011)? 1'b1:1'b0;
    assign MemtoReg = Lw;
    assign ALUSrc = (Opcode==6'b101011||I_format||Opcode==6'b100011)? 1'b1:1'b0;
    
    assign MemRead = ((Lw==1) && (Alu_resultHigh[21:0] != 22'h3FFFFF)) ? 1'b1:1'b0;  // Read memory
    assign IORead = ((Lw==1) && (Alu_resultHigh[21:0] == 22'h3FFFFF)) ? 1'b1:1'b0;  // Read input port
    assign IOWrite = ((Sw==1) && (Alu_resultHigh[21:0] == 22'h3FFFFF)) ? 1'b1:1'b0;  // Write output port

    assign MusicRead = ((Sw==1) && (Alu_resultHigh[21:0] == 22'h3FFFF0)) ? 1'b1:1'b0; // Music output port
        
    assign MemorIOtoReg = IORead || MemRead;
endmodule
