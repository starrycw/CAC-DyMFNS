`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/31 16:20:33
// Design Name: 
// Module Name: FNS_EncoderGlobalRepair_FTF09
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

module FNS_EncoderGlobalRepair_FTF09(
    input wire [8 : 1] flag,
    input wire [(`FNSCodec_DataWidth09 - 1) : 0] datain,
    
    input wire [(`FNSCodec_NSLEN02 - 1) : 0] ns02,
    input wire [(`FNSCodec_NSLEN03 - 1) : 0] ns03,
    input wire [(`FNSCodec_NSLEN04 - 1) : 0] ns04,
    input wire [(`FNSCodec_NSLEN05 - 1) : 0] ns05,
    input wire [(`FNSCodec_NSLEN06 - 1) : 0] ns06,
    input wire [(`FNSCodec_NSLEN07 - 1) : 0] ns07,
    input wire [(`FNSCodec_NSLEN08 - 1) : 0] ns08,
    input wire [(`FNSCodec_NSLEN09 - 1) : 0] ns09,
    
    output wire [8 : 0] codeout
    );
    
    // define r
    wire [(`FNSCodec_ResWidth02 - 1) : 0] res02;
    wire [(`FNSCodec_ResWidth03 - 1) : 0] res03;
    wire [(`FNSCodec_ResWidth04 - 1) : 0] res04;
    wire [(`FNSCodec_ResWidth05 - 1) : 0] res05;
    wire [(`FNSCodec_ResWidth06 - 1) : 0] res06;
    wire [(`FNSCodec_ResWidth07 - 1) : 0] res07;
    wire [(`FNSCodec_ResWidth08 - 1) : 0] res08;
    
    // calc r
    assign res02 = (codeout[2] == 0) ? (res03) : (res03 - ns03);
    assign res03 = (codeout[3] == 0) ? (res04) : (res04 - ns04);
    assign res04 = (codeout[4] == 0) ? (res05) : (res05 - ns05);
    assign res05 = (codeout[5] == 0) ? (res06) : (res06 - ns06);
    assign res06 = (codeout[6] == 0) ? (res07) : (res07 - ns07);
    assign res07 = (codeout[7] == 0) ? (res08) : (res08 - ns08);
    
    assign res08 = (codeout[8] == 0) ? (datain) : (datain - ns09);
    
    // encoding
    // 2, 3, 4, 5, 6, 7, 8, 9
    // 2, 2, 4, 4, 6, 6, 8, 8
    // 3, 3, 5, 5, 7, 7, 9, 9
    assign codeout[0] = (codeout[1] == 0) ? (res02) : (res02 - ns02);
    
    assign codeout[1] = (flag[1] == 0) ? (1'b0) : ((res02 < ns03) ? (1'b0) : (1'b1));
    assign codeout[2] = (flag[2] == 0) ? (1'b0) : ((res03 < ns03) ? (1'b0) : (1'b1));
    assign codeout[3] = (flag[3] == 0) ? (1'b0) : ((res04 < ns05) ? (1'b0) : (1'b1));
    assign codeout[4] = (flag[4] == 0) ? (1'b0) : ((res05 < ns05) ? (1'b0) : (1'b1));
    assign codeout[5] = (flag[5] == 0) ? (1'b0) : ((res06 < ns07) ? (1'b0) : (1'b1));
    assign codeout[6] = (flag[6] == 0) ? (1'b0) : ((res07 < ns07) ? (1'b0) : (1'b1));
    assign codeout[7] = (flag[7] == 0) ? (1'b0) : ((res08 < ns09) ? (1'b0) : (1'b1));
    
    assign codeout[8] = (flag[8] == 0) ? (1'b0) : ((datain < ns09) ? (1'b0) : (1'b1));
        
endmodule
