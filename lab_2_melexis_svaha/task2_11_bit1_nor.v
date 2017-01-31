`timescale 1ns / 1ps
module bit1_nor(
i_a,
i_b,
o_data
);

input i_a, i_b;

output o_data;

nor(o_data, i_a, i_b);

endmodule
