`timescale 1ns / 1ps
module bit4_sub(
i_a,
i_b,
i_a_g,
i_b_g,
i_bor,
o_sub,
o_sub_g,
o_b
);
parameter WIDTH = 4;

input[WIDTH-1:0] i_a, i_b, i_a_g, i_b_g;
input i_bor;

output[WIDTH-1:0] o_sub;
output signed [WIDTH:0] o_sub_g;
output o_b;

wire fs0_bor;
wire fs1_bor;
wire fs2_bor;
wire fs3_bor;


assign o_sub_g = i_a_g - i_b_g;

f_sub fs0(
.i_a(i_a[0]),
.i_b(i_b[0]),
.i_bor(i_bor),
.o_sub(o_sub[0]),
.o_b(fs0_bor)
);

f_sub fs1(
.i_a(i_a[1]),
.i_b(i_b[1]),
.i_bor(fs0_bor),
.o_sub(o_sub[1]),
.o_b(fs1_bor)
);

f_sub fs2(
.i_a(i_a[2]),
.i_b(i_b[2]),
.i_bor(fs1_bor),
.o_sub(o_sub[2]),
.o_b(fs2_bor)
);

f_sub fs3(
.i_a(i_a[3]),
.i_b(i_b[3]),
.i_bor(fs2_bor),
.o_sub(o_sub[3]),
.o_b(fs3_bor)
);

assign o_b = fs3_bor;
endmodule
