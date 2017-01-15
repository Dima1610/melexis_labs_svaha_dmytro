`timescale 1ns / 1ps
module comparator_signed(a, b, equal, greater, lower);
parameter width = 8;
input [width-1:0] a, b;
output reg equal, greater, lower;
reg signed [width:0] tmp;
reg signed [width-1:0] ain, bin;
always @(a, b) begin
  equal = 0;
  greater = 0; 
  lower = 0;
  ain = a;
  bin = b;
  tmp = ain - bin;
  if(!tmp) begin
    equal = 1;
  end else if(tmp[width]) begin 
     lower = 1;
  end else begin
     greater = 1;
  end
end
endmodule

