`timescale 1ns / 1ps

module add_sub_tb;

parameter WIDTH = 4;

reg [WIDTH-1:0] i_a, i_b;

reg  [WIDTH-1:0] i_a_g;

reg  [WIDTH-1:0] i_b_g;

wire [WIDTH:0] o_res_g;

wire [WIDTH-1:0] o_res;

wire o_c;

integer i, j, k;

add_sub add_sub(
		.i_a(i_a),
		.i_a_g(i_a_g),
		.i_b_g(i_b_g),
		.o_res_g(o_res_g),
		.i_b(i_b),
		.o_res(o_res),
		.o_c(o_c)			
			);


initial begin

	i_a = 4'b0000;
	i_b = 4'b0000;
	i_a_g = 4'b0000;
	i_b_g = 4'b0000;
	k = 0;
	
end



initial begin

forever #10
	begin 
		if ({o_c,o_res} !== o_res_g) begin
			k = k + 1;
			$display ("Time = %d;", $time, " Error", " Golden_Model = %b;", o_res_g, " Real_value = %b;", {o_c, o_res});
		end else begin
			k = k;
		end

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

