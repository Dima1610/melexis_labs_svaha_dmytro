`timescale 1ns / 1ps
module multiplier(
i_a,
i_b,
i_a_g,
i_b_g,
o_mult,
o_mult_g
);

parameter WIDTH = 4;

input [WIDTH-1:0] i_a, i_b, i_a_g, i_b_g;

output [2*WIDTH-1:0] o_mult, o_mult_g;

wire ha0_carry;
wire ha1_carry;
wire ha2_carry;
wire ha3_carry;
wire fa0_carry;
wire fa1_carry;
wire fa2_carry;
wire fa3_carry;
wire fa4_carry;
wire fa5_carry;
wire fa6_carry;
wire fa7_carry;
wire ha0_sum;
wire ha1_sum;
wire ha2_sum;
wire ha3_sum;
wire fa0_sum;
wire fa1_sum;
wire fa2_sum;
wire fa3_sum;
wire fa4_sum;
wire fa5_sum;
wire fa6_sum;
wire fa7_sum;
wire a1b0;
wire a0b1;
wire a2b0;
wire a1b1;
wire a0b2;
wire a3b0;
wire a2b1;
wire a1b2;
wire a0b3;
wire a3b1;
wire a2b2;
wire a1b3;
wire a3b2;
wire a2b3;
wire a3b3;

assign a1b0 = i_a[1] & i_b[0];
assign a0b1 = i_a[0] & i_b[1];
assign a2b0 = i_a[2] & i_b[0];
assign a1b1 = i_a[1] & i_b[1];
assign a0b2 = i_a[0] & i_b[2];
assign a3b0 = i_a[3] & i_b[0];
assign a2b1 = i_a[2] & i_b[1];
assign a1b2 = i_a[1] & i_b[2];
assign a0b3 = i_a[0] & i_b[3];
assign a3b1 = i_a[3] & i_b[1];
assign a2b2 = i_a[2] & i_b[2];
assign a1b3 = i_a[1] & i_b[3];
assign a3b2 = i_a[3] & i_b[2];
assign a2b3 = i_a[2] & i_b[3];
assign a3b3 = i_a[3] & i_b[3];

assign o_mult[0] = i_a[0] & i_b[0];
assign o_mult[1] = ha0_sum;
assign o_mult[2] = ha1_sum;
assign o_mult[3] = ha2_sum;
assign o_mult[4] = fa4_sum;
assign o_mult[5] = fa6_sum;
assign o_mult[6] = fa7_sum;
assign o_mult[7] = fa7_carry;

/*P1*/
half_adder ha0(
.i_a(a1b0),
.i_b(a0b1),
.o_si(ha0_sum),
.o_pi(ha0_carry)
);
/*P2*/
full_adder fa0(
.i_a(a2b0),
.i_b(a1b1),
.i_c(ha0_carry),
.o_si(fa0_sum),
.o_pi(fa0_carry)
);

half_adder ha1(
.i_a(fa0_sum),
.i_b(a0b2),
.o_si(ha1_sum),
.o_pi(ha1_carry)
);
/*P3*/
full_adder fa1(
.i_a(a3b0),
.i_b(a2b1),
.i_c(fa0_carry),
.o_si(fa1_sum),
.o_pi(fa1_carry)
);

full_adder fa2(
.i_a(fa1_sum),
.i_b(a1b2),
.i_c(ha1_carry),
.o_si(fa2_sum),
.o_pi(fa2_carry)
);

half_adder ha2(
.i_a(fa2_sum),
.i_b(a0b3),
.o_si(ha2_sum),
.o_pi(ha2_carry)
);
/*P4*/
half_adder ha3(
.i_a(a3b1),
.i_b(fa1_carry),
.o_si(ha3_sum),
.o_pi(ha3_carry)
);

full_adder fa3(
.i_a(ha3_sum),
.i_b(a2b2),
.i_c(fa2_carry),
.o_si(fa3_sum),
.o_pi(fa3_carry)
);

full_adder fa4(
.i_a(fa3_sum),
.i_b(a1b3),
.i_c(ha2_carry),
.o_si(fa4_sum),
.o_pi(fa4_carry)
);
/*P5*/
full_adder fa5(
.i_a(ha3_carry),
.i_b(a3b2),
.i_c(fa3_carry),
.o_si(fa5_sum),
.o_pi(fa5_carry)
);

full_adder fa6(
.i_a(fa5_sum),
.i_b(a2b3),
.i_c(fa4_carry),
.o_si(fa6_sum),
.o_pi(fa6_carry)
);
/*P6*/
full_adder fa7(
.i_a(fa5_carry),
.i_b(a3b3),
.i_c(fa6_carry),
.o_si(fa7_sum),
.o_pi(fa7_carry)
);

assign o_mult_g = i_a_g * i_b_g;

endmodule
