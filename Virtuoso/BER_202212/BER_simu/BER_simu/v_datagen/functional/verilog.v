//Verilog HDL for "BER_simu", "v_datagen" "functional"

module v_datagen (Mainclk, RandomData, Data_ref, clk);
	input wire Mainclk;
	output wire clk;
	output reg [123:0] RandomData;
	output reg [123:0] Data_ref;

	reg [123:0] Data_temp;

	assign clk = Mainclk;

	always @(negedge Mainclk) begin
		RandomData[9:0] <= $random%1025;
		RandomData[19:10] <= $random%1025;
		RandomData[29:20] <= $random%1025;
		RandomData[39:30] <= $random%1025;
		RandomData[49:40] <= $random%1025;
		RandomData[59:50] <= $random%1025;
		RandomData[69:60] <= $random%1025;
		RandomData[79:70] <= $random%1025;
		RandomData[89:80] <= $random%1025;
		RandomData[99:90] <= $random%1025;
		RandomData[109:100] <= $random%1025;
		RandomData[119:110] <= $random%1025;
		RandomData[123:120] <= $random%17;
	end

	always @(posedge Mainclk) begin
		Data_ref[123:0] <= Data_temp[123:0];
		Data_temp[123:0] <= RandomData[123:0];
	end	


endmodule
