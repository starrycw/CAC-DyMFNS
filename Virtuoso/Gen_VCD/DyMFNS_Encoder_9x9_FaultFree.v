`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/28 
// Design Name: 
// Module Name: DyMFNS_Encoder_9x9_FaultFree
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

module DyMFNS_Encoder_9x9_FaultFree(
    input wire [53 : 0] rawDataIn,
    output wire [80 : 0] codewordOut
);

    // flags
    wire [8:1] flag_nofault;
    assign flag_nofault = 8'b1111_1111;

    // Dy-MFNS seq
    wire [(`DYMFNS_ADDER_OUTB_BLEN_2 - 1) : 0] gseq02;
    wire [(`DYMFNS_ADDER_OUTA_BLEN_2 - 1) : 0] hseq02;
    wire [(`DYMFNS_ADDER_OUTB_BLEN_3 - 1) : 0] gseq03;
    wire [(`DYMFNS_ADDER_OUTA_BLEN_3 - 1) : 0] hseq03;
    wire [(`DYMFNS_ADDER_OUTB_BLEN_4 - 1) : 0] gseq04;
    wire [(`DYMFNS_ADDER_OUTA_BLEN_4 - 1) : 0] hseq04;
    wire [(`DYMFNS_ADDER_OUTB_BLEN_5 - 1) : 0] gseq05;
    wire [(`DYMFNS_ADDER_OUTA_BLEN_5 - 1) : 0] hseq05;
    wire [(`DYMFNS_ADDER_OUTB_BLEN_6 - 1) : 0] gseq06;
    wire [(`DYMFNS_ADDER_OUTA_BLEN_6 - 1) : 0] hseq06;
    wire [(`DYMFNS_ADDER_OUTB_BLEN_7 - 1) : 0] gseq07;
    wire [(`DYMFNS_ADDER_OUTA_BLEN_7 - 1) : 0] hseq07;
    wire [(`DYMFNS_ADDER_OUTB_BLEN_8 - 1) : 0] gseq08;
    wire [(`DYMFNS_ADDER_OUTA_BLEN_8 - 1) : 0] hseq08;
    wire [(`DYMFNS_ADDER_OUTB_BLEN_9 - 1) : 0] gseq09;
    wire [(`DYMFNS_ADDER_OUTA_BLEN_9 - 1) : 0] hseq09;

//    assign gseq02 = (`DYMFNS_ADDER_OUTB_BLEN_2)'d1;
//    assign hseq02 = (`DYMFNS_ADDER_OUTA_BLEN_2)'d2;
//    assign gseq03 = (`DYMFNS_ADDER_OUTB_BLEN_3)'d2;
//    assign hseq03 = (`DYMFNS_ADDER_OUTA_BLEN_3)'d3;
//    assign gseq04 = (`DYMFNS_ADDER_OUTB_BLEN_4)'d3;
//    assign hseq04 = (`DYMFNS_ADDER_OUTA_BLEN_4)'d5;
//    assign gseq05 = (`DYMFNS_ADDER_OUTB_BLEN_5)'d5;
//    assign hseq05 = (`DYMFNS_ADDER_OUTA_BLEN_5)'d8;
//    assign gseq06 = (`DYMFNS_ADDER_OUTB_BLEN_6)'d8;
//    assign hseq06 = (`DYMFNS_ADDER_OUTA_BLEN_6)'d13;
//    assign gseq07 = (`DYMFNS_ADDER_OUTB_BLEN_7)'d13;
//    assign hseq07 = (`DYMFNS_ADDER_OUTA_BLEN_7)'d21;
//    assign gseq08 = (`DYMFNS_ADDER_OUTB_BLEN_8)'d21;
//    assign hseq08 = (`DYMFNS_ADDER_OUTA_BLEN_8)'d34;
//    assign gseq09 = (`DYMFNS_ADDER_OUTB_BLEN_9)'d55;
//    assign hseq09 = (`DYMFNS_ADDER_OUTA_BLEN_9)'d55;

    assign gseq02 = 2'd1;
    assign hseq02 = 2'd2;
    assign gseq03 = 2'd2;
    assign hseq03 = 2'd3;
    assign gseq04 = 3'd3;
    assign hseq04 = 3'd5;
    assign gseq05 = 4'd5;
    assign hseq05 = 4'd8;
    assign gseq06 = 4'd8;
    assign hseq06 = 4'd13;
    assign gseq07 = 5'd13;
    assign hseq07 = 5'd21;
    assign gseq08 = 6'd21;
    assign hseq08 = 6'd34;
    assign gseq09 = 6'd55;
    assign hseq09 = 6'd55;


    // Encoders
    DyMFNS_Encoder_09 enc001(
    .flag(flag_nofault),
    .datain(rawDataIn[5 : 0]),
    
    .gseq02(gseq02),
    .hseq02(hseq02),
    .gseq03(gseq03),
    .hseq03(hseq03),
    .gseq04(gseq04),
    .hseq04(hseq04),
    .gseq05(gseq05),
    .hseq05(hseq05),
    .gseq06(gseq06),
    .hseq06(hseq06),
    .gseq07(gseq07),
    .hseq07(hseq07),
    .gseq08(gseq08),
    .hseq08(hseq08),
    .gseq09(gseq09),
    .hseq09(hseq09),
    
    .codeout(codewordOut[8 : 0])
    );


    DyMFNS_Encoder_09 enc002(
    .flag(flag_nofault),
    .datain(rawDataIn[11 : 6]),
    
    .gseq02(gseq02),
    .hseq02(hseq02),
    .gseq03(gseq03),
    .hseq03(hseq03),
    .gseq04(gseq04),
    .hseq04(hseq04),
    .gseq05(gseq05),
    .hseq05(hseq05),
    .gseq06(gseq06),
    .hseq06(hseq06),
    .gseq07(gseq07),
    .hseq07(hseq07),
    .gseq08(gseq08),
    .hseq08(hseq08),
    .gseq09(gseq09),
    .hseq09(hseq09),
    
    .codeout(codewordOut[17 : 9])
    );


    DyMFNS_Encoder_09 enc003(
    .flag(flag_nofault),
    .datain(rawDataIn[17 : 12]),
    
    .gseq02(gseq02),
    .hseq02(hseq02),
    .gseq03(gseq03),
    .hseq03(hseq03),
    .gseq04(gseq04),
    .hseq04(hseq04),
    .gseq05(gseq05),
    .hseq05(hseq05),
    .gseq06(gseq06),
    .hseq06(hseq06),
    .gseq07(gseq07),
    .hseq07(hseq07),
    .gseq08(gseq08),
    .hseq08(hseq08),
    .gseq09(gseq09),
    .hseq09(hseq09),
    
    .codeout(codewordOut[26 : 18])
    );


    DyMFNS_Encoder_09 enc004(
    .flag(flag_nofault),
    .datain(rawDataIn[23 : 18]),
    
    .gseq02(gseq02),
    .hseq02(hseq02),
    .gseq03(gseq03),
    .hseq03(hseq03),
    .gseq04(gseq04),
    .hseq04(hseq04),
    .gseq05(gseq05),
    .hseq05(hseq05),
    .gseq06(gseq06),
    .hseq06(hseq06),
    .gseq07(gseq07),
    .hseq07(hseq07),
    .gseq08(gseq08),
    .hseq08(hseq08),
    .gseq09(gseq09),
    .hseq09(hseq09),
    
    .codeout(codewordOut[35 : 27])
    );


    DyMFNS_Encoder_09 enc005(
    .flag(flag_nofault),
    .datain(rawDataIn[29 : 24]),
    
    .gseq02(gseq02),
    .hseq02(hseq02),
    .gseq03(gseq03),
    .hseq03(hseq03),
    .gseq04(gseq04),
    .hseq04(hseq04),
    .gseq05(gseq05),
    .hseq05(hseq05),
    .gseq06(gseq06),
    .hseq06(hseq06),
    .gseq07(gseq07),
    .hseq07(hseq07),
    .gseq08(gseq08),
    .hseq08(hseq08),
    .gseq09(gseq09),
    .hseq09(hseq09),
    
    .codeout(codewordOut[44 : 36])
    );


    DyMFNS_Encoder_09 enc006(
    .flag(flag_nofault),
    .datain(rawDataIn[35 : 30]),
    
    .gseq02(gseq02),
    .hseq02(hseq02),
    .gseq03(gseq03),
    .hseq03(hseq03),
    .gseq04(gseq04),
    .hseq04(hseq04),
    .gseq05(gseq05),
    .hseq05(hseq05),
    .gseq06(gseq06),
    .hseq06(hseq06),
    .gseq07(gseq07),
    .hseq07(hseq07),
    .gseq08(gseq08),
    .hseq08(hseq08),
    .gseq09(gseq09),
    .hseq09(hseq09),
    
    .codeout(codewordOut[53 : 45])
    );


    DyMFNS_Encoder_09 enc007(
    .flag(flag_nofault),
    .datain(rawDataIn[41 : 36]),
    
    .gseq02(gseq02),
    .hseq02(hseq02),
    .gseq03(gseq03),
    .hseq03(hseq03),
    .gseq04(gseq04),
    .hseq04(hseq04),
    .gseq05(gseq05),
    .hseq05(hseq05),
    .gseq06(gseq06),
    .hseq06(hseq06),
    .gseq07(gseq07),
    .hseq07(hseq07),
    .gseq08(gseq08),
    .hseq08(hseq08),
    .gseq09(gseq09),
    .hseq09(hseq09),
    
    .codeout(codewordOut[62 : 54])
    );


    DyMFNS_Encoder_09 enc008(
    .flag(flag_nofault),
    .datain(rawDataIn[47 : 42]),
    
    .gseq02(gseq02),
    .hseq02(hseq02),
    .gseq03(gseq03),
    .hseq03(hseq03),
    .gseq04(gseq04),
    .hseq04(hseq04),
    .gseq05(gseq05),
    .hseq05(hseq05),
    .gseq06(gseq06),
    .hseq06(hseq06),
    .gseq07(gseq07),
    .hseq07(hseq07),
    .gseq08(gseq08),
    .hseq08(hseq08),
    .gseq09(gseq09),
    .hseq09(hseq09),
    
    .codeout(codewordOut[71 : 63])
    );


    DyMFNS_Encoder_09 enc009(
    .flag(flag_nofault),
    .datain(rawDataIn[53 : 48]),
    
    .gseq02(gseq02),
    .hseq02(hseq02),
    .gseq03(gseq03),
    .hseq03(hseq03),
    .gseq04(gseq04),
    .hseq04(hseq04),
    .gseq05(gseq05),
    .hseq05(hseq05),
    .gseq06(gseq06),
    .hseq06(hseq06),
    .gseq07(gseq07),
    .hseq07(hseq07),
    .gseq08(gseq08),
    .hseq08(hseq08),
    .gseq09(gseq09),
    .hseq09(hseq09),
    
    .codeout(codewordOut[80 : 72])
    );


endmodule