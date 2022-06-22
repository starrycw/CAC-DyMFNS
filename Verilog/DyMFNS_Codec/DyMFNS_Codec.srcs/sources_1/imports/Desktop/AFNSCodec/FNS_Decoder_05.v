`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/31 21:05:40
// Design Name: 
// Module Name: FNS_Decoder_05
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

module FNS_Decoder_05(
    input wire [4 : 0] codein,
    
    input wire [(`FNSCodec_NSLEN02 - 1) : 0] ns02,
    input wire [(`FNSCodec_NSLEN03 - 1) : 0] ns03,
    input wire [(`FNSCodec_NSLEN04 - 1) : 0] ns04,
    input wire [(`FNSCodec_NSLEN05 - 1) : 0] ns05,
    
    output wire [(`FNSCodec_DataWidth05 - 1) : 0] dataout
    );
    
    wire v_ns01;
    wire [(`FNSCodec_NSLEN02 - 1) : 0] v_ns02;
    wire [(`FNSCodec_NSLEN03 - 1) : 0] v_ns03;
    wire [(`FNSCodec_NSLEN04 - 1) : 0] v_ns04;
    wire [(`FNSCodec_NSLEN05 - 1) : 0] v_ns05;
    
    
    assign v_ns01 = (codein[0] == 0) ? 0 : 1'b1;
    assign v_ns02 = (codein[1] == 0) ? 0 : ns02;
    assign v_ns03 = (codein[2] == 0) ? 0 : ns03;
    assign v_ns04 = (codein[3] == 0) ? 0 : ns04;
    assign v_ns05 = (codein[4] == 0) ? 0 : ns05;
    
    assign dataout = v_ns01 + v_ns02 + v_ns03 + v_ns04 + v_ns05;
      
endmodule
