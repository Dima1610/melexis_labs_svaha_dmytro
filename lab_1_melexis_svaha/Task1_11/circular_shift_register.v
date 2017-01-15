`timescale 1ns / 1ps
module circular_shift_register(
i_clk,
i_rst_n,
o_out);

parameter WIDTH = 4;

input i_clk, i_rst_n;
output reg [WIDTH-1:0] o_out;


always @(posedge i_clk or negedge i_rst_n) begin
if (!i_rst_n)begin
o_out <= 4'b1000;
end else begin
o_out <= {o_out[0] , o_out[WIDTH-1:1]};
end


end
endmodule
