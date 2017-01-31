`timescale 1ns / 1ps
module full_adder_4bit(
i_a,
i_b,
i_c,
o_pi,
o_s
);

parameter WIDTH = 4;

input [WIDTH-1:0] i_a, i_b;
input i_c;

output o_pi;
output [WIDTH-1:0] o_s;

wire fa0_ci;
wire fa1_ci;
wire fa2_ci;
wire fa3_ci;

full_adder fa0(
.i_a(i_a[0]),
.i_b(i_b[0]),
.i_c(i_c),
.o_si(o_s[0]),
.o_pi(fa0_ci)
);

full_adder fa1(
.i_a(i_a[1]),
.i_b(i_b[1]),
.i_c(fa0_ci),
.o_si(o_s[1]),
.o_pi(fa1_ci)
);


full_adder fa2(
.i_a(i_a[2]),
.i_b(i_b[2]),
.i_c(fa1_ci),
.o_si(o_s[2]),
.o_pi(fa2_ci)
);

full_adder fa3(
.i_a(i_a[3]),
.i_b(i_b[3]),
.i_c(fa2_ci),
.o_si(o_s[3]),
.o_pi(o_pi)
);

endmodule
