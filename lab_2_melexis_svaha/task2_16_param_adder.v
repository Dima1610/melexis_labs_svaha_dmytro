`timescale 1ns / 1ps
module param_adder(
i_a, 
i_b, 
i_c, 
o_si, 
o_pi
);

parameter WIDTH = 4;

input [WIDTH-1:0] i_a, i_b;

input i_c;

output [WIDTH-1:0] o_si;

output o_pi;

wire [WIDTH-1:0] carry; 

genvar i;

generate

for (i = 0; i < WIDTH; i = i + 1) begin: ADD
	if (i == 0) begin
		full_adder fa(
			.i_a(i_a[i]),
			.i_b(i_b[i]),
			.i_c(i_c),
			.o_si(o_si[i]),
			.o_pi(carry[i])
			);
	end else if (i == (WIDTH-1)) begin 
		full_adder fa(
			.i_a(i_a[i]),
			.i_b(i_b[i]),
			.i_c(carry[i-1]),
			.o_si(o_si[i]),
			.o_pi(o_pi)
			);
	end else begin 
		full_adder fa(
			.i_a(i_a[i]),
			.i_b(i_b[i]),
			.i_c(carry[i-1]),
			.o_si(o_si[i]),
			.o_pi(carry[i])
			);
		end
	end

endgenerate 

endmodule
