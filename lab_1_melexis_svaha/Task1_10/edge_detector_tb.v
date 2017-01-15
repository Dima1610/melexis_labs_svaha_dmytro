`timescale 1ns / 1ps
module edge_detector_tb();
  reg clk, n_rst, in;
  wire out;

edge_detector detector (
.clk(clk), 
.n_rst(n_rst), 
.in(in), 
.out(out)
);
initial begin
clk = 0;
forever #10 clk = ~clk;

end
initial begin
n_rst = 0;
in = 0;
#20
n_rst = 1;
#40
in = 1;
#70
in = 0;
$finish;
end
endmodule

