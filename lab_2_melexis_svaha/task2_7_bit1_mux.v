`timescale 1ns / 1ps
module bit1_mux(
i_ctrl,
i_data0,
i_data1,
i_data2,
i_data3,
i_data4,
o_data
);



input [2:0] i_ctrl;
input i_data0, i_data1, i_data2, i_data3, i_data4;

output o_data;
wire o_data0;
wire o_data1;
wire o_data2;
wire o_data3;
wire o_data4;
wire inv_i_ctrl0;
wire inv_i_ctrl1;
wire inv_i_ctrl2;
wire i_ctrl0;
wire i_ctrl1;
wire i_ctrl2;

assign i_ctrl0 =  i_ctrl[0];
assign i_ctrl1 =  i_ctrl[1];
assign i_ctrl2 =  i_ctrl[2];

assign inv_i_ctrl0 = ~i_ctrl[0];
assign inv_i_ctrl1 = ~i_ctrl[1];
assign inv_i_ctrl2 = ~i_ctrl[2]; 

assign o_data0 = inv_i_ctrl0 & inv_i_ctrl1 & inv_i_ctrl2 & i_data0;

assign o_data1 =     i_ctrl0 & inv_i_ctrl1 & inv_i_ctrl2 & i_data1;

assign o_data2 = inv_i_ctrl0 &     i_ctrl1 & inv_i_ctrl2 & i_data2;

assign o_data3 =     i_ctrl0 &     i_ctrl1 & inv_i_ctrl2 & i_data3;

assign o_data4 = inv_i_ctrl0 & inv_i_ctrl1 &     i_ctrl2 & i_data4;

assign o_data = o_data0 | o_data1 | o_data2 | o_data3 | o_data4;

endmodule
