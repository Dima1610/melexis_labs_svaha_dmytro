`timescale 1ns / 1ps
module johnson_counter_compare_tb();

parameter WIDTH = 4;

reg i_clk, i_rst_n;
reg [WIDTH-1:0] data_in; 
wire [WIDTH-1:0] data_out, o_out;

johnson_counter_compare counter (
.i_clk(i_clk),
.i_rst_n(i_rst_n),
.data_in(data_in),
.data_out(data_out),
.o_out(o_out));

initial begin
i_clk = 0;
i_rst_n = 0;
data_in = 4'b0000;
forever #10 i_clk = ~i_clk;
end

initial begin
forever #30 data_in = $random;

end

initial begin
#35 i_rst_n = ~i_rst_n;
#300 $finish;
end
endmodule
