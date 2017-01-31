`timescale 1ns / 1ps
module h_sub(
i_a,
i_b,
o_sub,
o_b
);


input i_a, i_b;

output o_sub, o_b;


assign o_sub = i_a ^ i_b;

assign o_b = !i_a & i_b;

endmodule
