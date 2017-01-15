`timescale 1ns / 1ps
module johnson_counter_tb();

parameter WIDTH = 4;

reg i_clk, i_rst_n;
wire [WIDTH-1:0] o_out;

johnson_counter counter (
.i_clk(i_clk),
.i_rst_n(i_rst_n),
.o_out(o_out));

initial begin
i_clk = 0;
i_rst_n = 0;

forever # 10 i_clk = ~i_clk;

end
initial begin
#35 i_rst_n = ~i_rst_n;
#300 $finish;

end
endmodule
