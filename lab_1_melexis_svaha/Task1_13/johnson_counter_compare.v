`timescale 1ns / 1ps
module johnson_counter_compare(
i_clk,
i_rst_n,
data_in,
data_out,
o_out
);

parameter WIDTH = 4;


input i_clk, i_rst_n;
input [WIDTH-1:0] data_in;
output reg [WIDTH-1:0] data_out, o_out;


always @(posedge i_clk or negedge i_rst_n) begin
	if(!i_rst_n)begin
		o_out <= 4'b0000;
	end else begin
		o_out <= {(!o_out[0]), o_out[WIDTH-1:1]};
	end
end

always @(i_clk or negedge i_rst_n) begin
	if(!i_rst_n)begin
		data_out <= 4'b0000;
	end else if(o_out[0]~^o_out[3]) begin
		data_out <= data_in;
	end else begin
		data_out <= data_out;	
	end
end

endmodule
