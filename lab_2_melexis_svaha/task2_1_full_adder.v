`timescale 1ns / 1ps
module full_adder(
i_a,
i_b,
i_c,
o_si,
o_pi
);

input i_a, i_b, i_c;

output o_si, o_pi;

wire ha1_sum;
wire ha2_sum;
wire ha1_carry;
wire ha2_carry;


half_adder ha1(
.i_a(i_a),
.i_b(i_b),
.o_si(ha1_sum),
.o_pi(ha1_carry)
);


half_adder ha2(
.i_a(ha1_sum),
.i_b(i_c),
.o_si(ha2_sum),
.o_pi(ha2_carry)
);

assign o_si = ha2_sum;

assign o_pi = ha1_carry | ha2_carry;

endmodule
