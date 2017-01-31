`timescale 1ns / 1ps
module multiplier_tb;

parameter WIDTH = 4;

reg [WIDTH-1:0] i_a, i_b, i_a_g, i_b_g;

wire [2*WIDTH-1:0] o_mult, o_mult_g;

integer i = 0, j = 0, k;

multiplier mp(
.i_a(i_a),
.i_b(i_b),
.i_a_g(i_a_g),
.i_b_g(i_b_g),
.o_mult(o_mult),
.o_mult_g(o_mult_g)
);


initial begin
	i_a = 4'b0000; 
i_b = 4'b0000;
i_a_g = 4'b0001;
i_b_g = 4'b0000;
k = 0;

end

initial begin
forever #10
if(o_mult !== o_mult_g)begin
				
		k = k + 1;
		$display ("Time = %d;", $time, " Error", " Golden_Model = %b;", o_mult_g, " Real_value = %b;", o_mult);
	end else begin
		k = k;	
		end
end

initial begin

for(i = 0; i < 16; i = i+1) begin
	for(j = 0; j < 16; j = j+1)begin
		#10
		i_b = j;
		i_b_g = j;
		
	end
	#10	
	i_a = i + 1;
	i_a_g = i + 1;
end

$display ("Error counter =%d",k);
$finish;
end
endmodule
