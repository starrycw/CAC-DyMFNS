`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/25 10:37:48
// Design Name: 
// Module Name: test_AFNSCodec
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
`include "Header_AdaptiveFNS.vh"
`include "Header_FNSCodec.vh"

module test_AFNSCodec(

    );
    
    reg [17 : 0] flag;
    reg [17 : 0] flag_rev;
    wire [17 : 0] flag_wire;
    wire [17 : 0] tsv;
    reg [(`FNSCodec_DataWidth18 - 1) : 0] rawdata_in;
    wire [(`FNSCodec_DataWidth18 - 1) : 0] rawdata_out;
    
    wire [(`FNSCodec_NSLEN02 - 1) : 0] ns02;
    wire [(`FNSCodec_NSLEN03 - 1) : 0] ns03;
    wire [(`FNSCodec_NSLEN04 - 1) : 0] ns04;
    wire [(`FNSCodec_NSLEN05 - 1) : 0] ns05;
    wire [(`FNSCodec_NSLEN06 - 1) : 0] ns06;
    wire [(`FNSCodec_NSLEN07 - 1) : 0] ns07;
    wire [(`FNSCodec_NSLEN08 - 1) : 0] ns08;
    wire [(`FNSCodec_NSLEN09 - 1) : 0] ns09;
    wire [(`FNSCodec_NSLEN10 - 1) : 0] ns10;
    wire [(`FNSCodec_NSLEN11 - 1) : 0] ns11;
    wire [(`FNSCodec_NSLEN12 - 1) : 0] ns12;
    wire [(`FNSCodec_NSLEN13 - 1) : 0] ns13;
    wire [(`FNSCodec_NSLEN14 - 1) : 0] ns14;
    wire [(`FNSCodec_NSLEN15 - 1) : 0] ns15;
    wire [(`FNSCodec_NSLEN16 - 1) : 0] ns16;
    wire [(`FNSCodec_NSLEN17 - 1) : 0] ns17;
    wire [(`FNSCodec_NSLEN18 - 1) : 0] ns18;
    
    AFNS_CascadedAdders_N18 adders(
        .flags(flag_rev),
        .out_b_01(ns01),
        //out_b_01,
        .out_b_02(ns02),
        //out_b_02,
        .out_b_03(ns03),
        //out_b_03,
        .out_b_04(ns04),
        //out_b_04,
        .out_b_05(ns05),
        //out_b_05,
        .out_b_06(ns06),
        //out_b_06,
        .out_b_07(ns07),
        //out_b_07,
        .out_b_08(ns08),
        //out_b_08,
        .out_b_09(ns09),
        //out_b_09,
        .out_b_10(ns10),
        //out_b_10,
        .out_b_11(ns11),
        //out_b_11,
        .out_b_12(ns12),
        //out_b_12,
        .out_b_13(ns13),
        //out_b_13,
        .out_b_14(ns14),
        //out_b_14,
        .out_b_15(ns15),
        //out_b_15,
        .out_b_16(ns16),
        //out_b_16,
        .out_b_17(ns17),
        //out_b_17,
        .out_b_18(ns18)
        //out_b_18
    );
    
    FNS_EncoderGlobalRepair_FTF18 encoder(
        flag[17:1],
        rawdata_in,
        
        ns02,
        ns03,
        ns04,
        ns05,
        ns06,
        ns07,
        ns08,
        ns09,
        ns10,
        ns11,
        ns12,
        ns13,
        ns14,
        ns15,
        ns16,
        ns17,
        ns18,
        ns19,
        
        tsv
    );
    
    FNS_DecoderSelfRepair_18 decoder(
        flag,
        tsv,
        
        ns02,
        ns03,
        ns04,
        ns05,
        ns06,
        ns07,
        ns08,
        ns09,
        ns10,
        ns11,
        ns12,
        ns13,
        ns14,
        ns15,
        ns16,
        ns17,
        ns18,
        
        rawdata_out
    );
    
    
    integer cnt_i;
    integer rawdata;
    integer result_pass;
    integer result_fail;
    //wire [17: 0] flag_wire;
    //assign flag_wire = 18'b11_1111_1111_1111_1111;
    
    initial begin: init
        result_pass = 0;
        result_fail = 0;        
        # 1;
        flag <= 18'b01_1111_1000_1111_0111;
        flag_rev <= 18'b0001_0000_1110_0000_01;
        rawdata_in <= `FNSCodec_DataWidth18'b0;
        # 5;
        for (cnt_i = 0; cnt_i < 10001; cnt_i = cnt_i + 1) begin: for01
            rawdata = {$random}% 450;
            # 2;
            rawdata_in = rawdata;
            # 2;
            if (rawdata_out == rawdata_in) begin
                $display("PASS: IN:%b,   OUT:%b,   TSV:%b ", rawdata_in, rawdata_out, tsv);
                result_pass = result_pass + 1;
            end
            if (rawdata_out != rawdata_in) begin
                $display(" FAIL: IN:%b,   OUT:%b,   TSV:%b ", rawdata_in, rawdata_out, tsv);
                result_fail = result_fail + 1;
            end
            # 2;
        end: for01
        
        $display("####### PASS: %d,   FAIL: %d ", result_pass, result_fail);
        $finish();         
        
    end: init
    
    
endmodule
