`timescale 1ns/ 1ps
module pipelined(
i_clk,
i_rst_n,
i_A,
i_B,
i_C,
o_Q,
o_Q_pipe
);

parameter WIDTH = 4;

input i_clk, i_rst_n;

input [WIDTH-1:0] i_A, i_B, i_C;

wire [WIDTH-1:0] AB_sum, ABxorC;

output reg [WIDTH-1:0] o_Q, o_Q_pipe;

reg[WIDTH-1:0] A, B, C, C_next, ABsum;

assign AB_sum = A + B; 
assign ABxorC = AB_sum ^ C;


always @(posedge i_clk or negedge i_rst_n) begin
	if(!i_rst_n)begin
		A <= 4'b0000; 
		B <= 4'b0000;
		C <= 4'b0000;
		C_next <= 4'b0000;
		o_Q <= 4'b0000;
		o_Q_pipe <= 4'b0000;
	end else begin
		o_Q_pipe <= ABsum ^ C_next;
	
		ABsum <= A + B;
	
		A <= i_A;

		B <= i_B;

		C_next <= C;

		C <= i_C;

		o_Q <= ABxorC;

end
end
endmodule
