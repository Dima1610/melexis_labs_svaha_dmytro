`timescale 1ns / 1ps
module full_adder_4bit2(
i_a,
i_b,
i_c,
i_a_g, 
i_b_g,
o_pi,
o_s,
o_sum_g
);

parameter WIDTH = 4;

input [WIDTH-1:0] i_a, i_b;
input [WIDTH-1:0] i_a_g, i_b_g;
input i_c;

output o_pi;
output [WIDTH-1:0] o_s;
output [WIDTH:0] o_sum_g;

wire fa0_ci;
wire fa1_ci;
wire fa2_ci;
wire fa3_ci;

assign o_sum_g = i_a_g + i_b_g;

full_adder2 fa0(
.i_a(i_a[0]),
.i_b(i_b[0]),
.i_c(i_c),
.o_si(o_s[0]),
.o_pi(fa0_ci)
);

full_adder2 fa1(
.i_a(i_a[1]),
.i_b(i_b[1]),
.i_c(fa0_ci),
.o_si(o_s[1]),
.o_pi(fa1_ci)
);


full_adder2 fa2(
.i_a(i_a[2]),
.i_b(i_b[2]),
.i_c(fa1_ci),
.o_si(o_s[2]),
.o_pi(fa2_ci)
);

full_adder2 fa3(
.i_a(i_a[3]),
.i_b(i_b[3]),
.i_c(fa2_ci),
.o_si(o_s[3]),
.o_pi(o_pi)
);

endmodule
