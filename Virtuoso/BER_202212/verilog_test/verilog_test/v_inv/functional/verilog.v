//Verilog HDL for "verilog_test", "v_inv" "functional"


module v_inv (IN, OUT );
input wire IN;
output wire OUT;

assign OUT = ~IN;
endmodule
