//Verilog HDL for "BER_simu", "v_count" "functional"


module v_count (clk, flag, ctrl, subcnt );
	input wire clk;
	input wire flag;
	input wire ctrl;
	output reg [15:0] subcnt;

	initial begin
		subcnt <= 0;
	end

	always @(posedge clk) begin
		subcnt <= subcnt + flag;
	end

	always @(posedge clk) begin
		$display("subcnt = %d", subcnt);
	end

endmodule
