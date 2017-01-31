`timescale 1ns / 1ps
module bit4_mux(
i_ctrl,
i_data0,
i_data1,
i_data2,
i_data3,
i_data4,
o_data,
);

parameter WIDTH = 4;

input [WIDTH-2:0] i_ctrl;
input [WIDTH-1:0] i_data0, i_data1, i_data2, i_data3, i_data4;

output [WIDTH-1:0] o_data; 

bit1_mux mx0(
.i_data0(i_data0[0]),
.i_data1(i_data1[0]),
.i_data2(i_data2[0]),
.i_data3(i_data3[0]),
.i_data4(i_data4[0]),
.i_ctrl(i_ctrl),
.o_data(o_data[0])
);

bit1_mux mx1(
.i_data0(i_data0[1]),
.i_data1(i_data1[1]),
.i_data2(i_data2[1]),
.i_data3(i_data3[1]),
.i_data4(i_data4[1]),
.i_ctrl(i_ctrl),
.o_data(o_data[1])
);

bit1_mux mx2(
.i_data0(i_data0[2]),
.i_data1(i_data1[2]),
.i_data2(i_data2[2]),
.i_data3(i_data3[2]),
.i_data4(i_data4[2]),
.i_ctrl(i_ctrl),
.o_data(o_data[2])
);

bit1_mux mx3(
.i_data0(i_data0[3]),
.i_data1(i_data1[3]),
.i_data2(i_data2[3]),
.i_data3(i_data3[3]),
.i_data4(i_data4[3]),
.i_ctrl(i_ctrl),
.o_data(o_data[3])
);



endmodule
