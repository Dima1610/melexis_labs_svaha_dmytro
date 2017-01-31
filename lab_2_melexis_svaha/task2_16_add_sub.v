`timescale 1ns / 1ps

//`define ADD
`define SUB

module add_sub(
i_a, 
i_b,
i_a_g,
i_b_g,
o_res,
o_res_g,
o_c
);

parameter WIDTH = 4;

input [WIDTH-1:0] i_a, i_b;

input  [WIDTH-1:0] i_a_g;

input  [WIDTH-1:0] i_b_g;

output [WIDTH:0] o_res_g;

output [WIDTH-1:0] o_res;

output o_c;

wire [WIDTH-1:0] i_b_in;

wire carry_i, carry_wire;

`ifdef ADD
	assign i_b_in = i_b;
	assign carry_i = 1'b0; 
	assign o_res_g = i_a_g + i_b_g;
				param_adder pa(
					.i_a(i_a),
					.i_b(i_b_in),
					.i_c(carry_i),
					.o_si(o_res),
					.o_pi(o_c)	
						);

`else 
	assign i_b_in = ~i_b;
	assign carry_i = 1'b1;
	assign o_res_g = i_a_g - i_b_g;
				param_adder pa(
					.i_a(i_a),
					.i_b(i_b_in),
					.i_c(carry_i),
					.o_si(o_res),
					.o_pi(carry_wire)	
						);
	assign o_c = ~carry_wire;
`endif

				
				



endmodule
