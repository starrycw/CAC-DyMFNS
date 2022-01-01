`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/30 20:01:33
// Design Name: 
// Module Name: Base_HalfAdder
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


module Base_HalfAdder(
    input wire A_in,
    input wire B_in,
    output wire S_out,
    output wire C_out
    );
    
    assign {C_out, S_out} = A_in + B_in;
    
endmodule
