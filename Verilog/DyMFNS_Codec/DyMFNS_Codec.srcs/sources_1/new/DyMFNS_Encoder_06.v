`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/24 15:42:24
// Design Name: 
// Module Name: DyMFNS_Encoder_06
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

module DyMFNS_Encoder_06(
    input wire [5 : 1] flag,
    input wire [(`DYMFNS_CODEC_RAWDATALEN_6 - 1) : 0] datain,
    
    input wire [(`DYMFNS_ADDER_OUTB_BLEN_2 - 1) : 0] gseq02,
    input wire [(`DYMFNS_ADDER_OUTA_BLEN_2 - 1) : 0] hseq02,
    input wire [(`DYMFNS_ADDER_OUTB_BLEN_3 - 1) : 0] gseq03,
    input wire [(`DYMFNS_ADDER_OUTA_BLEN_3 - 1) : 0] hseq03,
    input wire [(`DYMFNS_ADDER_OUTB_BLEN_4 - 1) : 0] gseq04,
    input wire [(`DYMFNS_ADDER_OUTA_BLEN_4 - 1) : 0] hseq04,
    input wire [(`DYMFNS_ADDER_OUTB_BLEN_5 - 1) : 0] gseq05,
    input wire [(`DYMFNS_ADDER_OUTA_BLEN_5 - 1) : 0] hseq05,
    input wire [(`DYMFNS_ADDER_OUTB_BLEN_6 - 1) : 0] gseq06,
    input wire [(`DYMFNS_ADDER_OUTA_BLEN_6 - 1) : 0] hseq06,
    
    output wire [5 : 0] codeout
    );
    
    // define res
    wire [(`DYMFNS_CODEC_RESLEN_2 - 1) : 0] res02;
    wire [(`DYMFNS_CODEC_RESLEN_3 - 1) : 0] res03;
    wire [(`DYMFNS_CODEC_RESLEN_4 - 1) : 0] res04;
    wire [(`DYMFNS_CODEC_RESLEN_5 - 1) : 0] res05;
    
    // calc res
    assign res02 = (codeout[2] == 0) ? (res03) : (res03 - gseq03);
    assign res03 = (codeout[3] == 0) ? (res04) : (res04 - gseq04);
    assign res04 = (codeout[4] == 0) ? (res05) : (res05 - gseq05);
    assign res05 = (codeout[5] == 0) ? (datain) : (datain - gseq06);
    
    // encoding
    assign codeout[0] = (codeout[1] == 0)? (res02) : (res02 - gseq02);
    
    assign codeout[1] = (flag[1] == 0)? (1'b0) : ( (res02 < gseq02)? (1'b0) : ( (res02 < hseq02)? (codeout[2]) : (1'b1) ) );
    assign codeout[2] = (flag[2] == 0)? (1'b0) : ( (res03 < gseq03)? (1'b0) : ( (res03 < hseq03)? (codeout[3]) : (1'b1) ) );
    assign codeout[3] = (flag[3] == 0)? (1'b0) : ( (res04 < gseq04)? (1'b0) : ( (res04 < hseq04)? (codeout[4]) : (1'b1) ) );
    assign codeout[4] = (flag[4] == 0)? (1'b0) : ( (res05 < gseq05)? (1'b0) : ( (res05 < hseq05)? (codeout[5]) : (1'b1) ) );
    
    assign codeout[5] = (flag[5] == 0)? (1'b0) : ( (datain < gseq06)? (1'b0) : (1'b1) );    
    
endmodule
