`timescale 1ns / 1ps
module bit4_nor_tb;

parameter WIDTH = 4;

reg [WIDTH-1:0] i_a, i_b, i_a_g, i_b_g;

wire [WIDTH-1:0] o_data, o_data_g;

integer i, j, k;

bit4_nor br4(
.i_a(i_a),
.i_b(i_b),
.o_data(o_data),
.i_a_g(i_a_g),
.i_b_g(i_b_g),
.o_data_g(o_data_g)
);


initial begin 
i_a = 4'b0000;
i_b = 4'b0000;
i_a_g = 4'b0000;
i_b_g = 4'b0000;
k = 0;
end


initial begin
for(i = 0; i < 16; i = i + 1) begin
	#10
	/*i_a = i+1; for testing displaying errors */
	i_a = i;
	i_a_g = i;
	
	for(j = 0; j < 16; j = j + 1) begin
	#10
	i_b = j;
	i_b_g = j;
				end
			end
$display("Error_counter =%d ", k);
$finish;
end


initial begin
forever #10
if(o_data !== o_data_g) begin
	k = k + 1;
	$display("Time=", $time, "Error", "Golden_value = %b",o_data_g, "Real_value = %b", o_data);
	end else begin
	k = k;
end

 
end
endmodule
