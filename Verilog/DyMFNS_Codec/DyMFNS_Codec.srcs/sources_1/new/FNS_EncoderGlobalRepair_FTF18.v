`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/24 21:06:29
// Design Name: 
// Module Name: FNS_EncoderGlobalRepair_FTF18
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

module FNS_EncoderGlobalRepair_FTF18(
    input wire [17 : 1] flag,
    input wire [(`FNSCodec_DataWidth18 - 1) : 0] datain,
    
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
    input wire [(`FNSCodec_NSLEN16 - 1) : 0] ns16,
    input wire [(`FNSCodec_NSLEN17 - 1) : 0] ns17,
    input wire [(`FNSCodec_NSLEN18 - 1) : 0] ns18,
    input wire [(`FNSCodec_NSLEN19 - 1) : 0] ns19,
    
    output wire [17 : 0] codeout
    );
    
    // define r
    wire [(`FNSCodec_ResWidth02 - 1) : 0] res02;
    wire [(`FNSCodec_ResWidth03 - 1) : 0] res03;
    wire [(`FNSCodec_ResWidth04 - 1) : 0] res04;
    wire [(`FNSCodec_ResWidth05 - 1) : 0] res05;
    wire [(`FNSCodec_ResWidth06 - 1) : 0] res06;
    wire [(`FNSCodec_ResWidth07 - 1) : 0] res07;
    wire [(`FNSCodec_ResWidth08 - 1) : 0] res08;
    wire [(`FNSCodec_ResWidth09 - 1) : 0] res09;
    wire [(`FNSCodec_ResWidth10 - 1) : 0] res10;
    wire [(`FNSCodec_ResWidth11 - 1) : 0] res11;
    wire [(`FNSCodec_ResWidth12 - 1) : 0] res12;
    wire [(`FNSCodec_ResWidth13 - 1) : 0] res13;
    wire [(`FNSCodec_ResWidth14 - 1) : 0] res14;
    wire [(`FNSCodec_ResWidth15 - 1) : 0] res15;
    wire [(`FNSCodec_ResWidth16 - 1) : 0] res16;
    wire [(`FNSCodec_ResWidth17 - 1) : 0] res17;
    
    // calc r
    assign res02 = (codeout[2] == 0) ? (res03) : (res03 - ns03);
    assign res03 = (codeout[3] == 0) ? (res04) : (res04 - ns04);
    assign res04 = (codeout[4] == 0) ? (res05) : (res05 - ns05);
    assign res05 = (codeout[5] == 0) ? (res06) : (res06 - ns06);
    assign res06 = (codeout[6] == 0) ? (res07) : (res07 - ns07);
    assign res07 = (codeout[7] == 0) ? (res08) : (res08 - ns08);
    assign res08 = (codeout[8] == 0) ? (res09) : (res09 - ns09);
    assign res09 = (codeout[9] == 0) ? (res10) : (res10 - ns10);
    assign res10 = (codeout[10] == 0) ? (res11) : (res11 - ns11);
    assign res11 = (codeout[11] == 0) ? (res12) : (res12 - ns12);
    assign res12 = (codeout[12] == 0) ? (res13) : (res13 - ns13);
    assign res13 = (codeout[13] == 0) ? (res14) : (res14 - ns14);
    assign res14 = (codeout[14] == 0) ? (res15) : (res15 - ns15);
    assign res15 = (codeout[15] == 0) ? (res16) : (res16 - ns16);
    assign res16 = (codeout[16] == 0) ? (res17) : (res17 - ns17);
    
    assign res17 = (codeout[17] == 0) ? (datain) : (datain - ns18);
    
    // encoding
    // 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18
    // 2, 2, 4, 4, 6, 6, 8, 8, 10, 10, 12, 12, 14, 14, 16, 16, 18
    // 3, 3, 5, 5, 7, 7, 9, 9, 11, 11, 13, 13, 15, 15, 17, 17, 19
    assign codeout[0] = (codeout[1] == 0) ? (res02) : (res02 - ns02);
    
    assign codeout[1] = (flag[1] == 0) ? (1'b0) : ((res02 < ns03) ? (1'b0) : (1'b1));
    assign codeout[2] = (flag[2] == 0) ? (1'b0) : ((res03 < ns03) ? (1'b0) : (1'b1));
    assign codeout[3] = (flag[3] == 0) ? (1'b0) : ((res04 < ns05) ? (1'b0) : (1'b1));
    assign codeout[4] = (flag[4] == 0) ? (1'b0) : ((res05 < ns05) ? (1'b0) : (1'b1));
    assign codeout[5] = (flag[5] == 0) ? (1'b0) : ((res06 < ns07) ? (1'b0) : (1'b1));
    assign codeout[6] = (flag[6] == 0) ? (1'b0) : ((res07 < ns07) ? (1'b0) : (1'b1));
    assign codeout[7] = (flag[7] == 0) ? (1'b0) : ((res08 < ns09) ? (1'b0) : (1'b1));
    assign codeout[8] = (flag[8] == 0) ? (1'b0) : ((res09 < ns09) ? (1'b0) : (1'b1));
    assign codeout[9] = (flag[9] == 0) ? (1'b0) : ((res10 < ns11) ? (1'b0) : (1'b1));
    assign codeout[10] = (flag[10] == 0) ? (1'b0) : ((res11 < ns11) ? (1'b0) : (1'b1));
    assign codeout[11] = (flag[11] == 0) ? (1'b0) : ((res12 < ns13) ? (1'b0) : (1'b1));
    assign codeout[12] = (flag[12] == 0) ? (1'b0) : ((res13 < ns13) ? (1'b0) : (1'b1));
    assign codeout[13] = (flag[13] == 0) ? (1'b0) : ((res14 < ns15) ? (1'b0) : (1'b1));
    assign codeout[14] = (flag[14] == 0) ? (1'b0) : ((res15 < ns15) ? (1'b0) : (1'b1));
    
    assign codeout[15] = (flag[15] == 0) ? (1'b0) : ((res16 < ns17) ? (1'b0) : (1'b1));
    assign codeout[16] = (flag[16] == 0) ? (1'b0) : ((res17 < ns17) ? (1'b0) : (1'b1));
    
    assign codeout[17] = (flag[17] == 0) ? (1'b0) : ((datain < ns19) ? (1'b0) : (1'b1));
        
endmodule
