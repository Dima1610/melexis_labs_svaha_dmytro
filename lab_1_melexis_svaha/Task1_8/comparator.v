`timescale 1ns / 1ps

module comparator(a, b, equal, greater, lower);

parameter width = 8;

input signed [width-1:0] a, b;

output reg equal, greater, lower;

wire signed [width:0] tmp;

assign tmp = a - b;

always @(tmp) begin

equal = 0;

greater = 0;

lower = 0;

if(!tmp) begin

equal = 1;

end else if(tmp[width]) begin //checking borrow bit

lower = 1;

end else begin

greater = 1;

end

end

endmodule
