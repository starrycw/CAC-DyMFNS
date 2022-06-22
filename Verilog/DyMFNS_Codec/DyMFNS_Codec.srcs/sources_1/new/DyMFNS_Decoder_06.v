`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/24 15:42:24
// Design Name: 
// Module Name: DyMFNS_Decoder_06
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
`include "Header_DyMFNS.vh"

module DyMFNS_Decoder_06(
    input wire [5 : 0] flag,
    input wire [5 : 0] codein,
    
    input wire [(`DYMFNS_ADDER_OUTB_BLEN_2 - 1) : 0] ns02,
    input wire [(`DYMFNS_ADDER_OUTB_BLEN_3 - 1) : 0] ns03,
    input wire [(`DYMFNS_ADDER_OUTB_BLEN_4 - 1) : 0] ns04,
    input wire [(`DYMFNS_ADDER_OUTB_BLEN_5 - 1) : 0] ns05,
    input wire [(`DYMFNS_ADDER_OUTB_BLEN_6 - 1) : 0] ns06,
    
    output wire [(`DYMFNS_CODEC_RAWDATALEN_6 - 1) : 0] dataout
    );
    
    wire v_ns01;
    wire [(`DYMFNS_ADDER_OUTB_BLEN_2 - 1) : 0] v_ns02;
    wire [(`DYMFNS_ADDER_OUTB_BLEN_3 - 1) : 0] v_ns03;
    wire [(`DYMFNS_ADDER_OUTB_BLEN_4 - 1) : 0] v_ns04;
    wire [(`DYMFNS_ADDER_OUTB_BLEN_5 - 1) : 0] v_ns05;
    wire [(`DYMFNS_ADDER_OUTB_BLEN_6 - 1) : 0] v_ns06;
    
    
    assign v_ns01 = ((flag[0] == 0) || (codein[0] == 0)) ? 0 : 1'b1;
    assign v_ns02 = ((flag[1] == 0) || (codein[1] == 0)) ? 0 : ns02;
    assign v_ns03 = ((flag[2] == 0) || (codein[2] == 0)) ? 0 : ns03;
    assign v_ns04 = ((flag[3] == 0) || (codein[3] == 0)) ? 0 : ns04;
    assign v_ns05 = ((flag[4] == 0) || (codein[4] == 0)) ? 0 : ns05;
    assign v_ns06 = ((flag[5] == 0) || (codein[5] == 0)) ? 0 : ns06;
    
    assign dataout = v_ns01 + v_ns02 + v_ns03 + v_ns04 + v_ns05 + v_ns06;
      
endmodule
