`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/07 21:30:37
// Design Name: 
// Module Name: AFNS_CascadedAdders_N09
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
module FNSGlobalRepair_CascadedAdders_09(
    // flags
    input wire [1:9] flags,
    
    // output ports
    output wire [6 : 1] flag_e,
    
    // output ports
    output wire out_a_01,
    output wire out_b_01,
    output wire [`AFNS_ADDER_OUTA_BLEN_2 - 1 : 0] out_a_02,
    output wire [`AFNS_ADDER_OUTB_BLEN_2 - 1 : 0] out_b_02,
    output wire [`AFNS_ADDER_OUTA_BLEN_3 - 1 : 0] out_a_03,
    output wire [`AFNS_ADDER_OUTB_BLEN_3 - 1 : 0] out_b_03,
    output wire [`AFNS_ADDER_OUTA_BLEN_4 - 1 : 0] out_a_04,
    output wire [`AFNS_ADDER_OUTB_BLEN_4 - 1 : 0] out_b_04,
    output wire [`AFNS_ADDER_OUTA_BLEN_5 - 1 : 0] out_a_05,
    output wire [`AFNS_ADDER_OUTB_BLEN_5 - 1 : 0] out_b_05,
    output wire [`AFNS_ADDER_OUTA_BLEN_6 - 1 : 0] out_a_06,
    output wire [`AFNS_ADDER_OUTB_BLEN_6 - 1 : 0] out_b_06,
    output wire [`AFNS_ADDER_OUTA_BLEN_7 - 1 : 0] out_a_07,
    output wire [`AFNS_ADDER_OUTB_BLEN_7 - 1 : 0] out_b_07,
    output wire [`AFNS_ADDER_OUTA_BLEN_8 - 1 : 0] out_a_08,
    output wire [`AFNS_ADDER_OUTB_BLEN_8 - 1 : 0] out_b_08,
    output wire [`AFNS_ADDER_OUTA_BLEN_9 - 1 : 0] out_a_09,
    output wire [`AFNS_ADDER_OUTB_BLEN_9 - 1 : 0] out_b_09
    );
    
//////////////////////////////////////////////////////////////////////////////////
// Design
//////////////////////////////////////////////////////////////////////////////////
    
    // Adder 1
    AFNS_Adder_01 adder01(.flag(flags[1]), .out_a(out_a_01), .out_b(out_b_01));
    
    // Adder 2
    AFNS_Adder_02 adder02( 
                            .flag(flags[2]),
                            .in_a(out_a_01),
                            .in_b(out_b_01),
                            .out_a(out_a_02),
                            .out_b(out_b_02)
                            );
    
    // Adder 3
    AFNS_Adder_03 adder03( 
                            .flag(flags[3]),
                            .in_a(out_a_02),
                            .in_b(out_b_02),
                            .out_a(out_a_03),
                            .out_b(out_b_03)
                            );
    
    // Adder 4
    AFNS_Adder_04 adder04( 
                            .flag(flags[4]),
                            .in_a(out_a_03),
                            .in_b(out_b_03),
                            .out_a(out_a_04),
                            .out_b(out_b_04)
                            );
    
    // Adder 5
    AFNS_Adder_05 adder05( 
                            .flag(flags[5]),
                            .in_a(out_a_04),
                            .in_b(out_b_04),
                            .out_a(out_a_05),
                            .out_b(out_b_05)
                            );
    
    // Adder 6
    AFNS_Adder_06 adder06( 
                            .flag(flags[6]),
                            .in_a(out_a_05),
                            .in_b(out_b_05),
                            .out_a(out_a_06),
                            .out_b(out_b_06)
                            );
    
    // Adder 7
    AFNS_Adder_07 adder07( 
                            .flag(flags[7]),
                            .in_a(out_a_06),
                            .in_b(out_b_06),
                            .out_a(out_a_07),
                            .out_b(out_b_07)
                            );
    
    // Adder 8
    AFNS_Adder_08 adder08( 
                            .flag(flags[8]),
                            .in_a(out_a_07),
                            .in_b(out_b_07),
                            .out_a(out_a_08),
                            .out_b(out_b_08)
                            );
    
    // Adder 9
    AFNS_Adder_09 adder09( 
                            .flag(flags[9]),
                            .in_a(out_a_08),
                            .in_b(out_b_08),
                            .out_a(out_a_09),
                            .out_b(out_b_09)
                            );
    
    // flag ei
    wire [9 : 1] fbmax_match;
    assign fbmax_match[9] = out_b_09[5];
    assign fbmax_match[8] = out_b_09[4];
    assign fbmax_match[7] = out_b_09[3] & out_b_09[2];
    assign fbmax_match[6] = out_b_09[3];
    assign fbmax_match[5] = out_b_09[2];
    assign fbmax_match[4] = out_b_09[1] & out_b_09[0];
    assign fbmax_match[3] = out_b_09[1];
    assign fbmax_match[2] = out_b_09[0];
    assign fbmax_match[1] = out_b_09[0];
    
    assign flag_e[6] = fbmax_match[9];
    assign flag_e[5] = flag_e[6] | fbmax_match[8] | fbmax_match[7];
    assign flag_e[4] = flag_e[5] | fbmax_match[6];
    assign flag_e[3] = flag_e[4] | fbmax_match[5] | fbmax_match[4];
    assign flag_e[2] = flag_e[3] | fbmax_match[3];
    assign flag_e[1] = flag_e[2] | fbmax_match[2];
    
endmodule

//Process finished with exit code 0

