`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/08 15:35:42
// Design Name: 
// Module Name: DyMFNS_CascadedAdders_N19
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


//E:\Workspace\Repositories\Research\TSV\TSV-DyMFNS\Python\DyMFNS_CAC\venv\Scripts\python.exe E:/Workspace/Repositories/Research/TSV/TSV-DyMFNS/Python/DyMFNS_CAC/cac_main/verilog_generation_tools.py
// Generated by cac_main.verilog_generation_tools. Version: 2022.01.09.00
`include "Header_DyMFNS.vh"
module DyMFNS_CascadedAdders_N19(
    // flags
    input wire [1:19] flags,
    // Output ports
    output wire out_a_01,
    output wire out_b_01,
    output wire [`DYMFNS_ADDER_OUTA_BLEN_2 - 1 : 0] out_a_02,
    output wire [`DYMFNS_ADDER_OUTB_BLEN_2 - 1 : 0] out_b_02,
    output wire [`DYMFNS_ADDER_OUTA_BLEN_3 - 1 : 0] out_a_03,
    output wire [`DYMFNS_ADDER_OUTB_BLEN_3 - 1 : 0] out_b_03,
    output wire [`DYMFNS_ADDER_OUTA_BLEN_4 - 1 : 0] out_a_04,
    output wire [`DYMFNS_ADDER_OUTB_BLEN_4 - 1 : 0] out_b_04,
    output wire [`DYMFNS_ADDER_OUTA_BLEN_5 - 1 : 0] out_a_05,
    output wire [`DYMFNS_ADDER_OUTB_BLEN_5 - 1 : 0] out_b_05,
    output wire [`DYMFNS_ADDER_OUTA_BLEN_6 - 1 : 0] out_a_06,
    output wire [`DYMFNS_ADDER_OUTB_BLEN_6 - 1 : 0] out_b_06,
    output wire [`DYMFNS_ADDER_OUTA_BLEN_7 - 1 : 0] out_a_07,
    output wire [`DYMFNS_ADDER_OUTB_BLEN_7 - 1 : 0] out_b_07,
    output wire [`DYMFNS_ADDER_OUTA_BLEN_8 - 1 : 0] out_a_08,
    output wire [`DYMFNS_ADDER_OUTB_BLEN_8 - 1 : 0] out_b_08,
    output wire [`DYMFNS_ADDER_OUTA_BLEN_9 - 1 : 0] out_a_09,
    output wire [`DYMFNS_ADDER_OUTB_BLEN_9 - 1 : 0] out_b_09,
    output wire [`DYMFNS_ADDER_OUTA_BLEN_10 - 1 : 0] out_a_10,
    output wire [`DYMFNS_ADDER_OUTB_BLEN_10 - 1 : 0] out_b_10,
    output wire [`DYMFNS_ADDER_OUTA_BLEN_11 - 1 : 0] out_a_11,
    output wire [`DYMFNS_ADDER_OUTB_BLEN_11 - 1 : 0] out_b_11,
    output wire [`DYMFNS_ADDER_OUTA_BLEN_12 - 1 : 0] out_a_12,
    output wire [`DYMFNS_ADDER_OUTB_BLEN_12 - 1 : 0] out_b_12,
    output wire [`DYMFNS_ADDER_OUTA_BLEN_13 - 1 : 0] out_a_13,
    output wire [`DYMFNS_ADDER_OUTB_BLEN_13 - 1 : 0] out_b_13,
    output wire [`DYMFNS_ADDER_OUTA_BLEN_14 - 1 : 0] out_a_14,
    output wire [`DYMFNS_ADDER_OUTB_BLEN_14 - 1 : 0] out_b_14,
    output wire [`DYMFNS_ADDER_OUTA_BLEN_15 - 1 : 0] out_a_15,
    output wire [`DYMFNS_ADDER_OUTB_BLEN_15 - 1 : 0] out_b_15,
    output wire [`DYMFNS_ADDER_OUTA_BLEN_16 - 1 : 0] out_a_16,
    output wire [`DYMFNS_ADDER_OUTB_BLEN_16 - 1 : 0] out_b_16,
    output wire [`DYMFNS_ADDER_OUTA_BLEN_17 - 1 : 0] out_a_17,
    output wire [`DYMFNS_ADDER_OUTB_BLEN_17 - 1 : 0] out_b_17,
    output wire [`DYMFNS_ADDER_OUTA_BLEN_18 - 1 : 0] out_a_18,
    output wire [`DYMFNS_ADDER_OUTB_BLEN_18 - 1 : 0] out_b_18,
    output wire [`DYMFNS_ADDER_OUTA_BLEN_19 - 1 : 0] out_a_19,
    output wire [`DYMFNS_ADDER_OUTB_BLEN_19 - 1 : 0] out_b_19
    );
    
    // flags
    wire [19:2] flags_notlsb; 
    
//////////////////////////////////////////////////////////////////////////////////
// Design
//////////////////////////////////////////////////////////////////////////////////
    
    DyMFNS_Adder_01 adder01(.flag(flags[1]), .flag_notlsb_out(flags_notlsb[2]), .out_a(out_a_01), .out_b(out_b_01));
    
    // Adder 2
    DyMFNS_Adder_02 adder02(.flag_left(flags[1]), 
                            .flag(flags[2]),
                            .flag_right(flags[3]),
                            .flag_notlsb_in(flags_notlsb[2]), 
                            .in_a(out_a_01),
                            .in_b(out_b_01),
                            .flag_notlsb_out(flags_notlsb[3]),
                            .out_a(out_a_02),
                            .out_b(out_b_02)
                            );
    
    // Adder 3
    DyMFNS_Adder_03 adder03(.flag_left(flags[2]), 
                            .flag(flags[3]),
                            .flag_right(flags[4]),
                            .flag_notlsb_in(flags_notlsb[3]), 
                            .in_a(out_a_02),
                            .in_b(out_b_02),
                            .flag_notlsb_out(flags_notlsb[4]),
                            .out_a(out_a_03),
                            .out_b(out_b_03)
                            );
    
    // Adder 4
    DyMFNS_Adder_04 adder04(.flag_left(flags[3]), 
                            .flag(flags[4]),
                            .flag_right(flags[5]),
                            .flag_notlsb_in(flags_notlsb[4]), 
                            .in_a(out_a_03),
                            .in_b(out_b_03),
                            .flag_notlsb_out(flags_notlsb[5]),
                            .out_a(out_a_04),
                            .out_b(out_b_04)
                            );
    
    // Adder 5
    DyMFNS_Adder_05 adder05(.flag_left(flags[4]), 
                            .flag(flags[5]),
                            .flag_right(flags[6]),
                            .flag_notlsb_in(flags_notlsb[5]), 
                            .in_a(out_a_04),
                            .in_b(out_b_04),
                            .flag_notlsb_out(flags_notlsb[6]),
                            .out_a(out_a_05),
                            .out_b(out_b_05)
                            );
    
    // Adder 6
    DyMFNS_Adder_06 adder06(.flag_left(flags[5]), 
                            .flag(flags[6]),
                            .flag_right(flags[7]),
                            .flag_notlsb_in(flags_notlsb[6]), 
                            .in_a(out_a_05),
                            .in_b(out_b_05),
                            .flag_notlsb_out(flags_notlsb[7]),
                            .out_a(out_a_06),
                            .out_b(out_b_06)
                            );
    
    // Adder 7
    DyMFNS_Adder_07 adder07(.flag_left(flags[6]), 
                            .flag(flags[7]),
                            .flag_right(flags[8]),
                            .flag_notlsb_in(flags_notlsb[7]), 
                            .in_a(out_a_06),
                            .in_b(out_b_06),
                            .flag_notlsb_out(flags_notlsb[8]),
                            .out_a(out_a_07),
                            .out_b(out_b_07)
                            );
    
    // Adder 8
    DyMFNS_Adder_08 adder08(.flag_left(flags[7]), 
                            .flag(flags[8]),
                            .flag_right(flags[9]),
                            .flag_notlsb_in(flags_notlsb[8]), 
                            .in_a(out_a_07),
                            .in_b(out_b_07),
                            .flag_notlsb_out(flags_notlsb[9]),
                            .out_a(out_a_08),
                            .out_b(out_b_08)
                            );
    
    // Adder 9
    DyMFNS_Adder_09 adder09(.flag_left(flags[8]), 
                            .flag(flags[9]),
                            .flag_right(flags[10]),
                            .flag_notlsb_in(flags_notlsb[9]), 
                            .in_a(out_a_08),
                            .in_b(out_b_08),
                            .flag_notlsb_out(flags_notlsb[10]),
                            .out_a(out_a_09),
                            .out_b(out_b_09)
                            );
    
    // Adder 10
    DyMFNS_Adder_10 adder10(.flag_left(flags[9]), 
                            .flag(flags[10]),
                            .flag_right(flags[11]),
                            .flag_notlsb_in(flags_notlsb[10]), 
                            .in_a(out_a_09),
                            .in_b(out_b_09),
                            .flag_notlsb_out(flags_notlsb[11]),
                            .out_a(out_a_10),
                            .out_b(out_b_10)
                            );
    
    // Adder 11
    DyMFNS_Adder_11 adder11(.flag_left(flags[10]), 
                            .flag(flags[11]),
                            .flag_right(flags[12]),
                            .flag_notlsb_in(flags_notlsb[11]), 
                            .in_a(out_a_10),
                            .in_b(out_b_10),
                            .flag_notlsb_out(flags_notlsb[12]),
                            .out_a(out_a_11),
                            .out_b(out_b_11)
                            );
    
    // Adder 12
    DyMFNS_Adder_12 adder12(.flag_left(flags[11]), 
                            .flag(flags[12]),
                            .flag_right(flags[13]),
                            .flag_notlsb_in(flags_notlsb[12]), 
                            .in_a(out_a_11),
                            .in_b(out_b_11),
                            .flag_notlsb_out(flags_notlsb[13]),
                            .out_a(out_a_12),
                            .out_b(out_b_12)
                            );
    
    // Adder 13
    DyMFNS_Adder_13 adder13(.flag_left(flags[12]), 
                            .flag(flags[13]),
                            .flag_right(flags[14]),
                            .flag_notlsb_in(flags_notlsb[13]), 
                            .in_a(out_a_12),
                            .in_b(out_b_12),
                            .flag_notlsb_out(flags_notlsb[14]),
                            .out_a(out_a_13),
                            .out_b(out_b_13)
                            );
    
    // Adder 14
    DyMFNS_Adder_14 adder14(.flag_left(flags[13]), 
                            .flag(flags[14]),
                            .flag_right(flags[15]),
                            .flag_notlsb_in(flags_notlsb[14]), 
                            .in_a(out_a_13),
                            .in_b(out_b_13),
                            .flag_notlsb_out(flags_notlsb[15]),
                            .out_a(out_a_14),
                            .out_b(out_b_14)
                            );
    
    // Adder 15
    DyMFNS_Adder_15 adder15(.flag_left(flags[14]), 
                            .flag(flags[15]),
                            .flag_right(flags[16]),
                            .flag_notlsb_in(flags_notlsb[15]), 
                            .in_a(out_a_14),
                            .in_b(out_b_14),
                            .flag_notlsb_out(flags_notlsb[16]),
                            .out_a(out_a_15),
                            .out_b(out_b_15)
                            );
    
    // Adder 16
    DyMFNS_Adder_16 adder16(.flag_left(flags[15]), 
                            .flag(flags[16]),
                            .flag_right(flags[17]),
                            .flag_notlsb_in(flags_notlsb[16]), 
                            .in_a(out_a_15),
                            .in_b(out_b_15),
                            .flag_notlsb_out(flags_notlsb[17]),
                            .out_a(out_a_16),
                            .out_b(out_b_16)
                            );
    
    // Adder 17
    DyMFNS_Adder_17 adder17(.flag_left(flags[16]), 
                            .flag(flags[17]),
                            .flag_right(flags[18]),
                            .flag_notlsb_in(flags_notlsb[17]), 
                            .in_a(out_a_16),
                            .in_b(out_b_16),
                            .flag_notlsb_out(flags_notlsb[18]),
                            .out_a(out_a_17),
                            .out_b(out_b_17)
                            );
    
    // Adder 18
    DyMFNS_Adder_18 adder18(.flag_left(flags[17]), 
                            .flag(flags[18]),
                            .flag_right(flags[19]),
                            .flag_notlsb_in(flags_notlsb[18]), 
                            .in_a(out_a_17),
                            .in_b(out_b_17),
                            .flag_notlsb_out(flags_notlsb[19]),
                            .out_a(out_a_18),
                            .out_b(out_b_18)
                            );
    
    // Adder 19
    DyMFNS_Adder_19 adder19(.flag_left(flags[18]), 
                            .flag(flags[19]),
                            .flag_right(1'b1),
                            .flag_notlsb_in(flags_notlsb[19]), 
                            .in_a(out_a_18),
                            .in_b(out_b_18),
                            .flag_notlsb_out(),
                            .out_a(out_a_19),
                            .out_b(out_b_19)
                            );
    
endmodule

//Process finished with exit code 0


