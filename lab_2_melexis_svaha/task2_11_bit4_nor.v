`timescale 1ns / 1ps
module bit4_nor(
i_a,
i_b,
i_a_g,
i_b_g,
o_data,
o_data_g
);

parameter WIDTH = 4;

input [WIDTH-1:0] i_a, i_b, i_a_g, i_b_g;

output [WIDTH-1:0] o_data, o_data_g;

bit1_nor br0(
.i_a(i_a[0]),
.i_b(i_b[0]),
.o_data(o_data[0])
);

bit1_nor br1(
.i_a(i_a[1]),
.i_b(i_b[1]),
.o_data(o_data[1])
);

bit1_nor br2(
.i_a(i_a[2]),
.i_b(i_b[2]),
.o_data(o_data[2])
);

bit1_nor br3(
.i_a(i_a[3]),
.i_b(i_b[3]),
.o_data(o_data[3])
);
assign o_data_g = ~(i_a | i_b);

endmodule
