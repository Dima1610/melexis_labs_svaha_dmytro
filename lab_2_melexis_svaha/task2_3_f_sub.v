`timescale 1ns / 1ps
module f_sub(
i_a,
i_b,
i_bor,
o_sub,
o_b
);


input i_a, i_b, i_bor;

output o_sub, o_b;

wire hs0_sub;
wire hs1_sub;
wire hs0_b;
wire hs1_b;


h_sub hs0(
.i_a(i_a),
.i_b(i_b),
.o_sub(hs0_sub),
.o_b(hs0_b)
);

h_sub hs1(
.i_a(hs0_sub),
.i_b(i_bor),
.o_sub(o_sub),
.o_b(hs1_b)
);

assign o_b = hs1_b | hs0_b;

endmodule
