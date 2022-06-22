`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/31 21:05:40
// Design Name: 
// Module Name: FNS_Decoder_10
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

module FNS_Decoder_10(
    input wire [9 : 0] codein,
    
    input wire [(`FNSCodec_NSLEN02 - 1) : 0] ns02,
    input wire [(`FNSCodec_NSLEN03 - 1) : 0] ns03,
    input wire [(`FNSCodec_NSLEN04 - 1) : 0] ns04,
    input wire [(`FNSCodec_NSLEN05 - 1) : 0] ns05,
    input wire [(`FNSCodec_NSLEN06 - 1) : 0] ns06,
    input wire [(`FNSCodec_NSLEN07 - 1) : 0] ns07,
    input wire [(`FNSCodec_NSLEN08 - 1) : 0] ns08,
    input wire [(`FNSCodec_NSLEN09 - 1) : 0] ns09,
    input wire [(`FNSCodec_NSLEN10 - 1) : 0] ns10,
    
    output wire [(`FNSCodec_DataWidth10 - 1) : 0] dataout
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
    
    
    assign v_ns01 = (codein[0] == 0) ? 0 : 1'b1;
    assign v_ns02 = (codein[1] == 0) ? 0 : ns02;
    assign v_ns03 = (codein[2] == 0) ? 0 : ns03;
    assign v_ns04 = (codein[3] == 0) ? 0 : ns04;
    assign v_ns05 = (codein[4] == 0) ? 0 : ns05;
    assign v_ns06 = (codein[5] == 0) ? 0 : ns06;
    assign v_ns07 = (codein[6] == 0) ? 0 : ns07;
    assign v_ns08 = (codein[7] == 0) ? 0 : ns08;
    assign v_ns09 = (codein[8] == 0) ? 0 : ns09;
    assign v_ns10 = (codein[9] == 0) ? 0 : ns10;
    
    assign dataout = v_ns01 + v_ns02 + v_ns03 + v_ns04 + v_ns05 + v_ns06 + v_ns07 + v_ns08 + v_ns09 + v_ns10;
      
endmodule
