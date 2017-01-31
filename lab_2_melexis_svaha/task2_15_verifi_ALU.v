`timescale 1ns / 1ps
module ALU_tb;

parameter WIDTH = 4;

reg [WIDTH-1:0] i_a, i_b, i_a_g, i_b_g;

reg [WIDTH-2:0] i_sel, i_sel_g;

wire [2*WIDTH-1:0] o_data, o_data_g;

integer i, j, k, m;

ALU al0(
.i_a(i_a),
.i_b(i_b),
.i_sel(i_sel),
.o_data(o_data)
);

ALU_behav ab0(
.i_a_g(i_a_g),
.i_b_g(i_b_g),
.i_sel_g(i_sel_g),
.o_data_g(o_data_g)
);


initial begin

i_a = 4'b0000;
i_b = 4'b0000;
i_a_g = 4'b0000;
i_b_g = 4'b0000;
i_sel = 4'b0000;
i_sel_g = 4'b0000;
k = 0;

end


initial begin

forever #10 
	if(o_data !== o_data_g) begin
		$display ("Error", "Time = ", $time, "Real_value = %b", o_data, "Golden_value = %b", o_data_g);
		k = k + 1;
	end else begin
		k = k;
	end
 
end

initial begin
	for(i = 0; i < 6; i = i + 1)begin
		for(j = 0; j < 16; j = j + 1)begin
			for(m = 0; m < 16; m = m + 1)begin
			#10
			i_b = m;
			i_b_g = m;
			end
		#10
		i_a = j;
		i_a_g = j;
		end
	#10
	i_sel = i;
	i_sel_g = i + 1; 
	end
$display("Error_counter = %d", k);
$finish;
end
endmodule


