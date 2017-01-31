`timescale 1ns / 1ps
module half_adder(
i_a, 
i_b, 
o_si, 
o_pi
);

input i_a, i_b;
output o_si, o_pi;


assign o_si = i_a ^ i_b;
assign o_pi = i_a & i_b;


endmodule

