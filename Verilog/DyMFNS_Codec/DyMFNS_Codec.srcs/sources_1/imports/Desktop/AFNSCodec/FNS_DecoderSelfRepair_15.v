`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/31 22:11:10
// Design Name: 
// Module Name: FNS_DecoderSelfRepair_15
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`include "Header_FNSCodec.vh"

module FNS_DecoderSelfRepair_15(
    input wire [14 : 0] flag,
    input wire [14 : 0] codein,
    
    input wire [(`FNSCodec_NSLEN02 - 1) : 0] ns02,
    input wire [(`FNSCodec_NSLEN03 - 1) : 0] ns03,
    input wire [(`FNSCodec_NSLEN04 - 1) : 0] ns04,
    input wire [(`FNSCodec_NSLEN05 - 1) : 0] ns05,
    input wire [(`FNSCodec_NSLEN06 - 1) : 0] ns06,
    input wire [(`FNSCodec_NSLEN07 - 1) : 0] ns07,
    input wire [(`FNSCodec_NSLEN08 - 1) : 0] ns08,
    input wire [(`FNSCodec_NSLEN09 - 1) : 0] ns09,
    input wire [(`FNSCodec_NSLEN10 - 1) : 0] ns10,
    input wire [(`FNSCodec_NSLEN11 - 1) : 0] ns11,
    input wire [(`FNSCodec_NSLEN12 - 1) : 0] ns12,
    input wire [(`FNSCodec_NSLEN13 - 1) : 0] ns13,
    input wire [(`FNSCodec_NSLEN14 - 1) : 0] ns14,
    input wire [(`FNSCodec_NSLEN15 - 1) : 0] ns15,
    
    output wire [(`FNSCodec_DataWidth15 - 1) : 0] dataout
    );
    
    wire v_ns01;
    wire [(`FNSCodec_NSLEN02 - 1) : 0] v_ns02;
    wire [(`FNSCodec_NSLEN03 - 1) : 0] v_ns03;
    wire [(`FNSCodec_NSLEN04 - 1) : 0] v_ns04;
    wire [(`FNSCodec_NSLEN05 - 1) : 0] v_ns05;
    wire [(`FNSCodec_NSLEN06 - 1) : 0] v_ns06;
    wire [(`FNSCodec_NSLEN07 - 1) : 0] v_ns07;
    wire [(`FNSCodec_NSLEN08 - 1) : 0] v_ns08;
    wire [(`FNSCodec_NSLEN09 - 1) : 0] v_ns09;
    wire [(`FNSCodec_NSLEN10 - 1) : 0] v_ns10;
    wire [(`FNSCodec_NSLEN11 - 1) : 0] v_ns11;
    wire [(`FNSCodec_NSLEN12 - 1) : 0] v_ns12;
    wire [(`FNSCodec_NSLEN13 - 1) : 0] v_ns13;
    wire [(`FNSCodec_NSLEN14 - 1) : 0] v_ns14;
    wire [(`FNSCodec_NSLEN15 - 1) : 0] v_ns15;
    
    
    assign v_ns01 = ((flag[0] == 0) || (codein[0] == 0)) ? 0 : 1'b1;
    assign v_ns02 = ((flag[1] == 0) || (codein[1] == 0)) ? 0 : ns02;
    assign v_ns03 = ((flag[2] == 0) || (codein[2] == 0)) ? 0 : ns03;
    assign v_ns04 = ((flag[3] == 0) || (codein[3] == 0)) ? 0 : ns04;
    assign v_ns05 = ((flag[4] == 0) || (codein[4] == 0)) ? 0 : ns05;
    assign v_ns06 = ((flag[5] == 0) || (codein[5] == 0)) ? 0 : ns06;
    assign v_ns07 = ((flag[6] == 0) || (codein[6] == 0)) ? 0 : ns07;
    assign v_ns08 = ((flag[7] == 0) || (codein[7] == 0)) ? 0 : ns08;
    assign v_ns09 = ((flag[8] == 0) || (codein[8] == 0)) ? 0 : ns09;
    assign v_ns10 = ((flag[9] == 0) || (codein[9] == 0)) ? 0 : ns10;
    assign v_ns11 = ((flag[10] == 0) || (codein[10] == 0)) ? 0 : ns11;
    assign v_ns12 = ((flag[11] == 0) || (codein[11] == 0)) ? 0 : ns12;
    assign v_ns13 = ((flag[12] == 0) || (codein[12] == 0)) ? 0 : ns13;
    assign v_ns14 = ((flag[13] == 0) || (codein[13] == 0)) ? 0 : ns14;
    assign v_ns15 = ((flag[14] == 0) || (codein[14] == 0)) ? 0 : ns15;
    
    assign dataout = v_ns01 + v_ns02 + v_ns03 + v_ns04 + v_ns05 + v_ns06 + v_ns07 + v_ns08 + v_ns09 + v_ns10 + v_ns11 + v_ns12 + v_ns13 + v_ns14 + v_ns15;
      
endmodule
