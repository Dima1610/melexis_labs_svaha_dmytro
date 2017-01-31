`timescale 1ns / 1ps
module gen_add_sub(
i_a,
i_b,
i_a_g,
i_b_g,
o_res,
o_c,
o_res_g
);

parameter ADDSUB = 1'b1;

parameter WIDTH = 4;

input [WIDTH-1:0] i_a, i_b, i_a_g, i_b_g;

output [WIDTH-1:0] o_res;

output [WIDTH:0] o_res_g;

output o_c;

wire o_carry;

generate 
	begin
		if (ADDSUB == 1'b1) begin
			assign	o_res_g = i_a_g + i_b_g;
				param_adder paa(
						.i_a(i_a),
						.i_b(i_b),
						.i_c(1'b0),
						.o_si(o_res),
						.o_pi(o_c)
							);
		end else if (ADDSUB == 1'b0) begin
			assign	o_res_g = i_a_g - i_b_g;
				param_adder pas(
						.i_a(i_a),
						.i_b(~i_b),
						.i_c(1'b1),
						.o_si(o_res),
						.o_pi(o_carry)
							);
			assign o_c = ~o_carry;

		end 
	end
endgenerate



endmodule
			

		


