`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/01 19:22:03
// Design Name: 
// Module Name: DyMFNS_Adder_01
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


module DyMFNS_Adder_01(
    input wire flag, 
    output wire flag_notlsb_out,
    output wire out_a,
    output wire out_b
    );
    
    assign out_a = 1'b1;
    assign out_b = (flag == 1'b0) ? (1'b1) : (1'b0);
    assign flag_notlsb_out = (~flag);
    
endmodule
