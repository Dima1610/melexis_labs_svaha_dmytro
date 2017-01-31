`timescale 1ns / 1ps
module bit4_mux_gm(
i_ctrl_g,
i_data0_g,
i_data1_g,
i_data2_g,
i_data3_g,
i_data4_g,
o_data_g
);

parameter WIDTH = 4;

input [WIDTH-2:0] i_ctrl_g;
input [WIDTH-1:0] i_data0_g, i_data1_g, i_data2_g, i_data3_g, i_data4_g;
output reg [WIDTH-1:0] o_data_g;

always @*
begin
	case(i_ctrl_g) 
		
		3'd0: o_data_g = i_data0_g;
		3'd1: o_data_g = i_data1_g;
		3'd2: o_data_g = i_data2_g;
		3'd3: o_data_g = i_data3_g;
		3'd4: o_data_g = i_data4_g;
		default: o_data_g = o_data_g;
	endcase
end


endmodule
