`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/30 17:02:35
// Design Name: 
// Module Name: FNS_Encoder_FTF04
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


module FNS_Encoder_FTF04(
    input wire [(`FNSCodec_DataWidth04 - 1) : 0] datain,
    
    input wire [(`FNSCodec_NSLEN02 - 1) : 0] ns02,
    input wire [(`FNSCodec_NSLEN03 - 1) : 0] ns03,
    input wire [(`FNSCodec_NSLEN04 - 1) : 0] ns04,
    input wire [(`FNSCodec_NSLEN05 - 1) : 0] ns05,
    
    output wire [3 : 0] codeout
    );
    
    // define r
    wire [(`FNSCodec_ResWidth02 - 1) : 0] res02;
    wire [(`FNSCodec_ResWidth03 - 1) : 0] res03;
    
    // calc r
    assign res02 = (codeout[2] == 0) ? (res03) : (res03 - ns03);
    assign res03 = (codeout[3] == 0) ? (datain) : (datain - ns04);
    
    // encoding
    // 2, 3, 4
    // 2, 2, 4
    // 3, 3, 5
    assign codeout[0] = (codeout[1] == 0) ? (res02) : (res02 - ns02);
    assign codeout[1] = (res02 < ns03) ? (1'b0) : (1'b1);
    assign codeout[2] = (res03 < ns03) ? (1'b0) : (1'b1);
    assign codeout[3] = (datain < ns05) ? (1'b0) : (1'b1);
    
    
endmodule
