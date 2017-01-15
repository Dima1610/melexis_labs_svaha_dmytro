`timescale 1ns/ 1ps
module pipelined_tb();

parameter WIDTH = 4;

reg i_clk, i_rst_n;

reg [WIDTH-1:0] i_A, i_B, i_C;

wire [WIDTH-1:0] o_Q, o_Q_pipe;

pipelined pipeline(
.i_clk(i_clk),
.i_rst_n(i_rst_n),
.i_A(i_A),
.i_B(i_B),
.i_C(i_C),
.o_Q(o_Q),
.o_Q_pipe(o_Q_pipe)
);


initial begin

i_clk = 0;

i_rst_n = 0;

i_A = 4'b0100;

i_B = 4'b0100;

i_C = 4'b0001;

end

initial begin 

forever #20 i_clk = ~i_clk;



end

initial begin 
@(negedge i_clk) i_rst_n = 1;

@(negedge i_clk) i_A = 4'b1001;

i_B = 4'b0011;

i_C = 4'b1101;

@(negedge i_clk) i_A = 4'b1101;

i_B = 4'b0101;

i_C = 4'b0010;

@(negedge i_clk) i_A = 4'b0001;

i_B = 4'b1101;

i_C = 4'b0110;

@(negedge i_clk) i_A = 4'b1101;

i_C = 4'b1100;

@(negedge i_clk) i_A = 4'b1001;

i_B = 4'b0110;

i_C = 4'b0101;

@(negedge i_clk) i_A = 4'b1010;

i_B = 4'b0101;

i_C = 4'b0111;

@(negedge i_clk) i_A = 4'b0010;

i_B = 4'b1111;

i_C = 4'b0010;

@(negedge i_clk) i_A = 4'b1110;

i_B = 4'b1000;

i_C = 4'b0101;


@(negedge i_clk) i_A = 4'b1100;

i_B = 4'b1101;

i_C = 4'b1101;

@(negedge i_clk) i_A = 4'b0101;

i_B = 4'b0011;

i_C = 4'b1010;

@(negedge i_clk) i_A = 4'b0000;

i_B = 4'b0000;

@(negedge i_clk) i_A = 4'b1101;

i_B = 4'b0110;

i_C = 4'b0011;

$finish;

end



endmodule
