`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/31 16:20:33
// Design Name: 
// Module Name: FNS_EncoderGlobalRepair_FTF05
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

module FNS_EncoderGlobalRepair_FTF05(
    input wire [4 : 1] flag,
    input wire [(`FNSCodec_DataWidth05 - 1) : 0] datain,
    
    input wire [(`FNSCodec_NSLEN02 - 1) : 0] ns02,
    input wire [(`FNSCodec_NSLEN03 - 1) : 0] ns03,
    input wire [(`FNSCodec_NSLEN04 - 1) : 0] ns04,
    input wire [(`FNSCodec_NSLEN05 - 1) : 0] ns05,
    
    output wire [4 : 0] codeout
    );
    
    // define r
    wire [(`FNSCodec_ResWidth02 - 1) : 0] res02;
    wire [(`FNSCodec_ResWidth03 - 1) : 0] res03;
    wire [(`FNSCodec_ResWidth04 - 1) : 0] res04;
    
    // calc r
    assign res02 = (codeout[2] == 0) ? (res03) : (res03 - ns03);
    assign res03 = (codeout[3] == 0) ? (res04) : (res04 - ns04);
    
    assign res04 = (codeout[4] == 0) ? (datain) : (datain - ns05);
    
    // encoding
    // 2, 3, 4, 5
    // 2, 2, 4, 4
    // 3, 3, 5, 5
    assign codeout[0] = (codeout[1] == 0) ? (res02) : (res02 - ns02);
    
    assign codeout[1] = (flag[1] == 0) ? (1'b0) : ((res02 < ns03) ? (1'b0) : (1'b1));
    assign codeout[2] = (flag[2] == 0) ? (1'b0) : ((res03 < ns03) ? (1'b0) : (1'b1));
    assign codeout[3] = (flag[3] == 0) ? (1'b0) : ((res04 < ns05) ? (1'b0) : (1'b1));
    
    assign codeout[4] = (flag[4] == 0) ? (1'b0) : ((datain < ns05) ? (1'b0) : (1'b1));
        
endmodule

