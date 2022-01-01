`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/30 16:21:20
// Design Name: 
// Module Name: AFNS_Adder_01
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

module AFNS_Adder_01(
    input wire flag,
    output wire out_a,
    output wire out_b
    );
    
    assign out_a = 1'b1;
    assign out_b = (flag == 1'b0) ? (1'b1) : (1'b0);
    
    
endmodule
