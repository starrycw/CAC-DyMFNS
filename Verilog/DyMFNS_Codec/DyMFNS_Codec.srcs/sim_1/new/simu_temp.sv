`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/28 16:06:49
// Design Name: 
// Module Name: simu_temp
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


module simu_temp(
    
    );
    
    reg Ain, Bin, Cin;
    wire SoutH, CoutH, SoutF, CoutF;
        
    initial begin: initial01
        #5;
        {Ain, Bin, Cin} <= 3'b000;
        #5;
        $display("A_in=%d, B_in=%d, C_in=%d. Half: S=%d, C=%d; Full: S=%d, C=%d.",Ain, Bin, Cin, SoutH, CoutH, SoutF, CoutF); 
        
        #5;
        {Ain, Bin, Cin} <= 3'b001;
        #5;
        $display("A_in=%d, B_in=%d, C_in=%d. Half: S=%d, C=%d; Full: S=%d, C=%d.",Ain, Bin, Cin, SoutH, CoutH, SoutF, CoutF);
        
        #5;
        {Ain, Bin, Cin} <= 3'b010;
        #5;
        $display("A_in=%d, B_in=%d, C_in=%d. Half: S=%d, C=%d; Full: S=%d, C=%d.",Ain, Bin, Cin, SoutH, CoutH, SoutF, CoutF);
        
        #5;
        {Ain, Bin, Cin} <= 3'b011;
        #5;
        $display("A_in=%d, B_in=%d, C_in=%d. Half: S=%d, C=%d; Full: S=%d, C=%d.",Ain, Bin, Cin, SoutH, CoutH, SoutF, CoutF);
        
        #5;
        {Ain, Bin, Cin} <= 3'b100;
        #5;
        $display("A_in=%d, B_in=%d, C_in=%d. Half: S=%d, C=%d; Full: S=%d, C=%d.",Ain, Bin, Cin, SoutH, CoutH, SoutF, CoutF);
        
        #5;
        {Ain, Bin, Cin} <= 3'b101;
        #5;
        $display("A_in=%d, B_in=%d, C_in=%d. Half: S=%d, C=%d; Full: S=%d, C=%d.",Ain, Bin, Cin, SoutH, CoutH, SoutF, CoutF);
        
        #5;
        {Ain, Bin, Cin} <= 3'b110;
        #5;
        $display("A_in=%d, B_in=%d, C_in=%d. Half: S=%d, C=%d; Full: S=%d, C=%d.",Ain, Bin, Cin, SoutH, CoutH, SoutF, CoutF);
        
        #5;
        {Ain, Bin, Cin} <= 3'b111;
        #5;
        $display("A_in=%d, B_in=%d, C_in=%d. Half: S=%d, C=%d; Full: S=%d, C=%d.",Ain, Bin, Cin, SoutH, CoutH, SoutF, CoutF);
        
        #5;
        $finish();        
    end:initial01
    
    half_adder adder01(.A_in(Ain), .B_in(Bin), .S_out(SoutH), .C_out(CoutH));
    full_adder adder02(.A_in(Ain), .B_in(Bin), .C_in(Cin), .S_out(SoutF), .C_out(CoutF));  
    
endmodule

