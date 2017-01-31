`timescale 1ns / 1ps
module ALU(
i_a,
i_b,
i_sel,
o_data
);

parameter WIDTH = 4;

input [WIDTH-1:0] i_a, i_b;

input [WIDTH-2:0] i_sel;

output [2*WIDTH-1:0] o_data;


wire [2*WIDTH-1:0] o_data_mult;
wire [WIDTH-1:0] o_data_sub_0;
wire [WIDTH-1:0] o_data_add_0;
wire [WIDTH-1:0] o_data_nand_0;
wire [WIDTH-1:0] o_data_nor_0;
wire [WIDTH-1:0] o_data_sub_1;
wire [WIDTH-1:0] o_data_add_1;
wire [WIDTH-1:0] o_data_nand_1;
wire [WIDTH-1:0] o_data_nor_1;
wire [WIDTH-1:0] i_a_mult;
wire [WIDTH-1:0] i_a_sub;
wire [WIDTH-1:0] i_a_add;
wire [WIDTH-1:0] i_a_nand;
wire [WIDTH-1:0] i_a_nor;
wire [WIDTH-1:0] i_b_mult;
wire [WIDTH-1:0] i_b_sub;
wire [WIDTH-1:0] i_b_add;
wire [WIDTH-1:0] i_b_nand;
wire [WIDTH-1:0] i_b_nor;
wire i_c = 1'b0;
wire i_bor = 1'b0;

assign i_a_mult = i_a;
assign i_a_sub = i_a;
assign i_a_add = i_a;
assign i_a_nand = i_a;
assign i_a_nor = i_a;
assign i_b_mult = i_b;
assign i_b_sub = i_b;
assign i_b_add = i_b;
assign i_b_nand = i_b;
assign i_b_nor = i_b;

full_adder_4bit fa(
.i_a(i_a_add),
.i_b(i_b_add),
.i_c(i_c),
.o_s(o_data_add_0)
);

bit4_sub fs(
.i_a(i_a_sub),
.i_b(i_b_sub),
.i_bor(i_bor),
.o_sub(o_data_sub_0)
);

multiplier mp(
.i_a(i_a_mult),
.i_b(i_b_mult),
.o_mult(o_data_mult)
);

bit4_nand bn(
.i_a(i_a_nand),
.i_b(i_b_nand),
.o_data(o_data_nand_0)
);

bit4_nor br(
.i_a(i_a_nor), 
.i_b(i_b_nor),
.o_data(o_data_nor_0)
);

bit4_mux bm0(
.i_data0(o_data_add_0),
.i_data1(o_data_sub_0),
.i_data2(o_data_mult[3:0]),
.i_data3(o_data_nand_0),
.i_data4(o_data_nor_0),
.i_ctrl(i_sel),
.o_data(o_data[3:0])
);

bit4_mux bm1(
.i_data0(o_data_add_1),
.i_data1(o_data_sub_1),
.i_data2(o_data_mult[7:4]),
.i_data3(o_data_nand_1),
.i_data4(o_data_nor_1),
.i_ctrl(i_sel),
.o_data(o_data[7:4])
);

assign o_data_add_1 = 4'b0000;
assign o_data_sub_1 = 4'b0000;
assign o_data_nand_1 = 4'b0000;
assign o_data_nor_1 = 4'b0000;

endmodule
