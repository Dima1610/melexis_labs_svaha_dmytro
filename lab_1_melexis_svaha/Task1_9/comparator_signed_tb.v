`timescale 1ns / 1ps
module comparator_signed_tb;
parameter width = 4;
parameter delay = 10;
reg [width-1:0] a, b;
wire equal, greater, lower;
integer i, j;
comparator #(.width(width)) cmp_inst1(.a(a), 
                                      .b(b), 
                                      .equal(equal),
                                      .greater(greater),
                                      .lower(lower)
                                      );
initial begin
  a = 0;
  b = 0;
  for(i=0; i>-(2**width); i=i-1) begin
    for(j=0; j>-(2**width); j=j-1) begin
      #delay;
      a = i;
      b = j;
    end
  end
  $finish;   
end
endmodule

