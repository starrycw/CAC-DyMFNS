`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/24 15:42:24
// Design Name: 
// Module Name: DyMFNS_Encoder_16
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

module DyMFNS_Encoder_16(
    input wire [15: 1] flag,
    input wire [(`DYMFNS_CODEC_RAWDATALEN_16 - 1) : 0] datain,
    
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
    input wire [(`DYMFNS_ADDER_OUTB_BLEN_7 - 1) : 0] gseq07,
    input wire [(`DYMFNS_ADDER_OUTA_BLEN_7 - 1) : 0] hseq07,
    input wire [(`DYMFNS_ADDER_OUTB_BLEN_8 - 1) : 0] gseq08,
    input wire [(`DYMFNS_ADDER_OUTA_BLEN_8 - 1) : 0] hseq08,
    input wire [(`DYMFNS_ADDER_OUTB_BLEN_9 - 1) : 0] gseq09,
    input wire [(`DYMFNS_ADDER_OUTA_BLEN_9 - 1) : 0] hseq09,
    input wire [(`DYMFNS_ADDER_OUTB_BLEN_10 - 1) : 0] gseq10,
    input wire [(`DYMFNS_ADDER_OUTA_BLEN_10 - 1) : 0] hseq10,
    input wire [(`DYMFNS_ADDER_OUTB_BLEN_11 - 1) : 0] gseq11,
    input wire [(`DYMFNS_ADDER_OUTA_BLEN_11 - 1) : 0] hseq11,
    input wire [(`DYMFNS_ADDER_OUTB_BLEN_12 - 1) : 0] gseq12,
    input wire [(`DYMFNS_ADDER_OUTA_BLEN_12 - 1) : 0] hseq12,
    input wire [(`DYMFNS_ADDER_OUTB_BLEN_13 - 1) : 0] gseq13,
    input wire [(`DYMFNS_ADDER_OUTA_BLEN_13 - 1) : 0] hseq13,
    input wire [(`DYMFNS_ADDER_OUTB_BLEN_14 - 1) : 0] gseq14,
    input wire [(`DYMFNS_ADDER_OUTA_BLEN_14 - 1) : 0] hseq14,
    input wire [(`DYMFNS_ADDER_OUTB_BLEN_15 - 1) : 0] gseq15,
    input wire [(`DYMFNS_ADDER_OUTA_BLEN_15 - 1) : 0] hseq15,
    input wire [(`DYMFNS_ADDER_OUTB_BLEN_16 - 1) : 0] gseq16,
    input wire [(`DYMFNS_ADDER_OUTA_BLEN_16 - 1) : 0] hseq16,
    
    output wire [15 : 0] codeout
    );
    
    // define res
    wire [(`DYMFNS_CODEC_RESLEN_2 - 1) : 0] res02;
    wire [(`DYMFNS_CODEC_RESLEN_3 - 1) : 0] res03;
    wire [(`DYMFNS_CODEC_RESLEN_4 - 1) : 0] res04;
    wire [(`DYMFNS_CODEC_RESLEN_5 - 1) : 0] res05;
    wire [(`DYMFNS_CODEC_RESLEN_6 - 1) : 0] res06;
    wire [(`DYMFNS_CODEC_RESLEN_7 - 1) : 0] res07;
    wire [(`DYMFNS_CODEC_RESLEN_8 - 1) : 0] res08;
    wire [(`DYMFNS_CODEC_RESLEN_9 - 1) : 0] res09;
    wire [(`DYMFNS_CODEC_RESLEN_10 - 1) : 0] res10;
    wire [(`DYMFNS_CODEC_RESLEN_11 - 1) : 0] res11;
    wire [(`DYMFNS_CODEC_RESLEN_12 - 1) : 0] res12;
    wire [(`DYMFNS_CODEC_RESLEN_13 - 1) : 0] res13;
    wire [(`DYMFNS_CODEC_RESLEN_14 - 1) : 0] res14;
    wire [(`DYMFNS_CODEC_RESLEN_15 - 1) : 0] res15;
    
    // calc res
    assign res02 = (codeout[2] == 0) ? (res03) : (res03 - gseq03);
    assign res03 = (codeout[3] == 0) ? (res04) : (res04 - gseq04);
    assign res04 = (codeout[4] == 0) ? (res05) : (res05 - gseq05);
    assign res05 = (codeout[5] == 0) ? (res06) : (res06 - gseq06);
    assign res06 = (codeout[6] == 0) ? (res07) : (res07 - gseq07);
    assign res07 = (codeout[7] == 0) ? (res08) : (res08 - gseq08);
    assign res08 = (codeout[8] == 0) ? (res09) : (res09 - gseq09);
    assign res09 = (codeout[9] == 0) ? (res10) : (res10 - gseq10);
    assign res10 = (codeout[10] == 0) ? (res11) : (res11 - gseq11);
    assign res11 = (codeout[11] == 0) ? (res12) : (res12 - gseq12);
    assign res12 = (codeout[12] == 0) ? (res13) : (res13 - gseq13);
    assign res13 = (codeout[13] == 0) ? (res14) : (res14 - gseq14);
    assign res14 = (codeout[14] == 0) ? (res15) : (res15 - gseq15);
    assign res15 = (codeout[15] == 0) ? (datain) : (datain - gseq16);
    
    // encoding
    assign codeout[0] = (codeout[1] == 0)? (res02) : (res02 - gseq02);
    
    assign codeout[1] = (flag[1] == 0)? (1'b0) : ( (res02 < gseq02)? (1'b0) : ( (res02 < hseq02)? (codeout[2]) : (1'b1) ) );
    assign codeout[2] = (flag[2] == 0)? (1'b0) : ( (res03 < gseq03)? (1'b0) : ( (res03 < hseq03)? (codeout[3]) : (1'b1) ) );
    assign codeout[3] = (flag[3] == 0)? (1'b0) : ( (res04 < gseq04)? (1'b0) : ( (res04 < hseq04)? (codeout[4]) : (1'b1) ) );
    assign codeout[4] = (flag[4] == 0)? (1'b0) : ( (res05 < gseq05)? (1'b0) : ( (res05 < hseq05)? (codeout[5]) : (1'b1) ) );
    assign codeout[5] = (flag[5] == 0)? (1'b0) : ( (res06 < gseq06)? (1'b0) : ( (res06 < hseq06)? (codeout[6]) : (1'b1) ) );
    assign codeout[6] = (flag[6] == 0)? (1'b0) : ( (res07 < gseq07)? (1'b0) : ( (res07 < hseq07)? (codeout[7]) : (1'b1) ) );
    assign codeout[7] = (flag[7] == 0)? (1'b0) : ( (res08 < gseq08)? (1'b0) : ( (res08 < hseq08)? (codeout[8]) : (1'b1) ) );
    assign codeout[8] = (flag[8] == 0)? (1'b0) : ( (res09 < gseq09)? (1'b0) : ( (res09 < hseq09)? (codeout[9]) : (1'b1) ) );
    assign codeout[9] = (flag[9] == 0)? (1'b0) : ( (res10 < gseq10)? (1'b0) : ( (res10 < hseq10)? (codeout[10]) : (1'b1) ) );
    assign codeout[10] = (flag[10] == 0)? (1'b0) : ( (res11 < gseq11)? (1'b0) : ( (res11 < hseq11)? (codeout[11]) : (1'b1) ) );
    assign codeout[11] = (flag[11] == 0)? (1'b0) : ( (res12 < gseq12)? (1'b0) : ( (res12 < hseq12)? (codeout[12]) : (1'b1) ) );
    assign codeout[12] = (flag[12] == 0)? (1'b0) : ( (res13 < gseq13)? (1'b0) : ( (res13 < hseq13)? (codeout[13]) : (1'b1) ) );
    assign codeout[13] = (flag[13] == 0)? (1'b0) : ( (res14 < gseq14)? (1'b0) : ( (res14 < hseq14)? (codeout[14]) : (1'b1) ) );
    assign codeout[14] = (flag[14] == 0)? (1'b0) : ( (res15 < gseq15)? (1'b0) : ( (res15 < hseq15)? (codeout[15]) : (1'b1) ) );
    
    assign codeout[15] = (flag[15] == 0)? (1'b0) : ( (datain < gseq16)? (1'b0) : (1'b1) );    
    
endmodule

