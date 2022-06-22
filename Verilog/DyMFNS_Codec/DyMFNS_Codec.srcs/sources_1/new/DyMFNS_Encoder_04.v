`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/24 15:42:24
// Design Name: 
// Module Name: DyMFNS_Encoder_04
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

module DyMFNS_Encoder_04(
    input wire [3 : 1] flag,
    input wire [(`DYMFNS_CODEC_RAWDATALEN_4 - 1) : 0] datain,
    
    input wire [(`DYMFNS_ADDER_OUTB_BLEN_2 - 1) : 0] gseq02,
    input wire [(`DYMFNS_ADDER_OUTA_BLEN_2 - 1) : 0] hseq02,
    input wire [(`DYMFNS_ADDER_OUTB_BLEN_3 - 1) : 0] gseq03,
    input wire [(`DYMFNS_ADDER_OUTA_BLEN_3 - 1) : 0] hseq03,
    input wire [(`DYMFNS_ADDER_OUTB_BLEN_4 - 1) : 0] gseq04,
    input wire [(`DYMFNS_ADDER_OUTA_BLEN_4 - 1) : 0] hseq04,
    
    output wire [3 : 0] codeout
    );
    
    // define res
    wire [(`DYMFNS_CODEC_RESLEN_2 - 1) : 0] res02;
    wire [(`DYMFNS_CODEC_RESLEN_3 - 1) : 0] res03;
    
    // calc res
    assign res02 = (codeout[2] == 0) ? (res03) : (res03 - gseq03);
    assign res03 = (codeout[3] == 0) ? (datain) : (datain - gseq04);
    
    // encoding
    assign codeout[0] = (codeout[1] == 0)? (res02) : (res02 - gseq02);
    
    assign codeout[1] = (flag[1] == 0)? (1'b0) : ( (res02 < gseq02)? (1'b0) : ( (res02 < hseq02)? (codeout[2]) : (1'b1) ) );
    assign codeout[2] = (flag[2] == 0)? (1'b0) : ( (res03 < gseq03)? (1'b0) : ( (res03 < hseq03)? (codeout[3]) : (1'b1) ) );
    
    assign codeout[3] = (flag[3] == 0)? (1'b0) : ( (datain < gseq04)? (1'b0) : (1'b1) );    
    
endmodule
