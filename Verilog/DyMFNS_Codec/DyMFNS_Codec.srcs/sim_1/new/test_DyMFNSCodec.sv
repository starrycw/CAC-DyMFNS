`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/25 10:37:48
// Design Name: 
// Module Name: test_DyMFNSCodec
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

module test_DyMFNSCodec(

    );
    
    reg [17: 0] flag;
    reg [17: 0] flag_rev;
    wire [17 : 0] tsv;
    
    reg [(`DYMFNS_CODEC_RAWDATALEN_18 - 1) : 0] rawdata_in;
    wire [(`DYMFNS_CODEC_RAWDATALEN_18 - 1) : 0] rawdata_out;
    
    wire gseq01;
    wire hseq01;
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
    wire [(`DYMFNS_ADDER_OUTB_BLEN_10 - 1) : 0] gseq10;
    wire [(`DYMFNS_ADDER_OUTA_BLEN_10 - 1) : 0] hseq10;
    wire [(`DYMFNS_ADDER_OUTB_BLEN_11 - 1) : 0] gseq11;
    wire [(`DYMFNS_ADDER_OUTA_BLEN_11 - 1) : 0] hseq11;
    wire [(`DYMFNS_ADDER_OUTB_BLEN_12 - 1) : 0] gseq12;
    wire [(`DYMFNS_ADDER_OUTA_BLEN_12 - 1) : 0] hseq12;
    wire [(`DYMFNS_ADDER_OUTB_BLEN_13 - 1) : 0] gseq13;
    wire [(`DYMFNS_ADDER_OUTA_BLEN_13 - 1) : 0] hseq13;
    wire [(`DYMFNS_ADDER_OUTB_BLEN_14 - 1) : 0] gseq14;
    wire [(`DYMFNS_ADDER_OUTA_BLEN_14 - 1) : 0] hseq14;
    wire [(`DYMFNS_ADDER_OUTB_BLEN_15 - 1) : 0] gseq15;
    wire [(`DYMFNS_ADDER_OUTA_BLEN_15 - 1) : 0] hseq15;
    wire [(`DYMFNS_ADDER_OUTB_BLEN_16 - 1) : 0] gseq16;
    wire [(`DYMFNS_ADDER_OUTA_BLEN_16 - 1) : 0] hseq16;
    wire [(`DYMFNS_ADDER_OUTB_BLEN_17 - 1) : 0] gseq17;
    wire [(`DYMFNS_ADDER_OUTA_BLEN_17 - 1) : 0] hseq17;
    wire [(`DYMFNS_ADDER_OUTB_BLEN_18 - 1) : 0] gseq18;
    wire [(`DYMFNS_ADDER_OUTA_BLEN_18 - 1) : 0] hseq18;
    
    // Designs
    DyMFNS_CascadedAdders_N18 adders(
        .flags(flag_rev),
    
        .out_a_01(hseq01),
        .out_b_01(gseq01),
        .out_a_02(hseq02),
        .out_b_02(gseq02),
        .out_a_03(hseq03),
        .out_b_03(gseq03),
        .out_a_04(hseq04),
        .out_b_04(gseq04),
        .out_a_05(hseq05),
        .out_b_05(gseq05),
        .out_a_06(hseq06),
        .out_b_06(gseq06),
        .out_a_07(hseq07),
        .out_b_07(gseq07),
        .out_a_08(hseq08),
        .out_b_08(gseq08),
        .out_a_09(hseq09),
        .out_b_09(gseq09),
        .out_a_10(hseq10),
        .out_b_10(gseq10),
        .out_a_11(hseq11),
        .out_b_11(gseq11),
        .out_a_12(hseq12),
        .out_b_12(gseq12),
        .out_a_13(hseq13),
        .out_b_13(gseq13),
        .out_a_14(hseq14),
        .out_b_14(gseq14),
        .out_a_15(hseq15),
        .out_b_15(gseq15),
        .out_a_16(hseq16),
        .out_b_16(gseq16),
        .out_a_17(hseq17),
        .out_b_17(gseq17),
        .out_a_18(hseq18),
        .out_b_18(gseq18)
    );
    
    DyMFNS_Encoder_18 encoder(
        .flag(flag[17:1]),
        .datain(rawdata_in),
    
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
        .gseq10(gseq10),
        .hseq10(hseq10),
        .gseq11(gseq11),
        .hseq11(hseq11),
        .gseq12(gseq12),
        .hseq12(hseq12),
        .gseq13(gseq13),
        .hseq13(hseq13),
        .gseq14(gseq14),
        .hseq14(hseq14),
        .gseq15(gseq15),
        .hseq15(hseq15),
        .gseq16(gseq16),
        .hseq16(hseq16),
        .gseq17(gseq17),
        .hseq17(hseq17),
        .gseq18(gseq18),
        .hseq18(hseq18),
    
        .codeout(tsv)
    );
    
    DyMFNS_Decoder_18 decoder(
        .flag(flag),
        .codein(tsv),
    
        .ns02(gseq02),
        .ns03(gseq03),
        .ns04(gseq04),
        .ns05(gseq05),
        .ns06(gseq06),
        .ns07(gseq07),
        .ns08(gseq08),
        .ns09(gseq09),
        .ns10(gseq10),
        .ns11(gseq11),
        .ns12(gseq12),
        .ns13(gseq13),
        .ns14(gseq14),
        .ns15(gseq15),
        .ns16(gseq16),
        .ns17(gseq17),
        .ns18(gseq18),
    
        .dataout(rawdata_out)
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
        flag <= 18'b01_1111_1000_1111_0111;;
        flag_rev <= 18'b0001_0000_1110_0000_01;;
        rawdata_in <= `DYMFNS_CODEC_RAWDATALEN_18'b0;
        # 5;
        for (cnt_i = 0; cnt_i < 10001; cnt_i = cnt_i + 1) begin: for01
            rawdata = {$random}% 1200;
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
