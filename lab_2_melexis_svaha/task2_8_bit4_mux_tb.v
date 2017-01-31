`timescale 1ns / 1ps
module bit4_mux_tb;

parameter WIDTH = 4;

reg [WIDTH-2:0] i_ctrl, i_ctrl_g;
reg [WIDTH-1:0] i_data0, i_data1, i_data2, i_data3, i_data4, i_data0_g, i_data1_g, i_data2_g, i_data3_g, i_data4_g;

wire [WIDTH-1:0] o_data, o_data_g; 
integer i, k;


bit4_mux mx4(
.i_ctrl(i_ctrl),
.i_data0(i_data0),
.i_data1(i_data1),
.i_data2(i_data2),
.i_data3(i_data3),
.i_data4(i_data4),
.o_data(o_data)
);

bit4_mux_gm mx44(
.i_ctrl_g(i_ctrl_g),
.i_data0_g(i_data0_g),
.i_data1_g(i_data1_g),
.i_data2_g(i_data2_g),
.i_data3_g(i_data3_g),
.i_data4_g(i_data4_g),
.o_data_g(o_data_g)
);

initial begin

i_data0 = 4'b0000;
i_data1 = 4'b0000;
i_data2 = 4'b0000;
i_data3 = 4'b0000;
i_data4 = 4'b0000;

i_data0_g = 4'b0000;
i_data1_g = 4'b0000;
i_data2_g = 4'b0000;
i_data3_g = 4'b0000;
i_data4_g = 4'b0000;

i_ctrl = 3'b000;
i_ctrl_g = 3'b000;
k = 0;

end

initial begin
forever #10
if(o_data !== o_data_g)begin
				
		k = k + 1;
		$display ("Time = %d;", $time, " Error", " Golden_Model = %b;", o_data_g, " Real_value = %b;", o_data);
	end else begin
		k = k;	
		end
end

initial begin 

for(i = 0; i < 5; i = i + 1) begin
	#10
	i_ctrl = i;
	i_ctrl_g = i;
end

end

initial begin

#10

i_data0 = 4'b0110;
i_data1 = 4'b0010;
i_data2 = 4'b1010;
i_data3 = 4'b1001;
i_data4 = 4'b1101;

i_data0_g = 4'b0110;
i_data1_g = 4'b0010;
i_data2_g = 4'b1000;
i_data3_g = 4'b1001;
i_data4_g = 4'b1101;

#100
$display("Error counter =%d", k);
 $finish;
end
endmodule
