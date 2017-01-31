`timescale 1ns / 1ps
module bit1_nand(
i_a,
i_b,
o_data
);

input i_a, i_b;

output o_data;


nand (o_data, i_a, i_b);

endmodule
