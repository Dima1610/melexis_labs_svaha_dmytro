`timescale 1ns / 1ps

module reg_8bit_tb;

parameter period = 4;

reg clk, rst_n, we_n;

reg [7:0] data_in;

wire [7:0] data_out;

integer i;

reg_8bit reg_inst1(.clk(clk),

.rst_n(rst_n),

.we_n(we_n),

.data_in(data_in),

.data_out(data_out)

);

initial begin

clk = 0;

we_n = 1;

forever #(period/2) clk = ~clk;

end

initial

begin

forever #10 we_n = ~we_n;

end

initial begin

rst_n = 0;

data_in = 0; //all variables should be initialized at the beginning

//of simulation


@(negedge clk) rst_n = 1;

for (i=0; i<256; i=i+1) begin

@(negedge clk) data_in = i;

end

@(negedge clk);

$finish;

end
endmodule
