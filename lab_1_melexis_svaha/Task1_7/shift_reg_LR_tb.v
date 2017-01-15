`timescale 1ns / 1ps

module param_shift_reg_LR_tb;

parameter period = 4;

parameter width = 8;

reg clk, rst_n, vector;

reg data_in;

wire [width-1:0] data_out;

param_shift_reg #(.width(width)) reg_inst1(.clk(clk),

.vector(vector),

.rst_n(rst_n),

.data_in(data_in),

.data_out(data_out) );

initial begin

clk = 0;

vector = 0;

forever #(period/2) clk = ~clk;

end

initial begin
@(posedge clk)

 # 20 

vector = ~vector;

end

initial begin

rst_n = 0;

data_in = 0;

@(negedge clk) rst_n = 1;

data_in = 1;

@(negedge clk);

@(negedge clk);

data_in = 0;

repeat(4) @(negedge clk);

data_in = 1;

repeat(2) @(negedge clk);

$finish;

end

endmodule
