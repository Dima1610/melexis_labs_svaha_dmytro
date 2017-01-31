`timescale 1ns / 1ps
module ALU_behav(
i_sel_g,
i_a_g,
i_b_g,
o_data_g
);

parameter WIDTH = 4;

input [WIDTH-1:0] i_a_g, i_b_g;

input [WIDTH-2:0] i_sel_g;

output reg [2*WIDTH-1:0] o_data_g;


wire [WIDTH-1:0] i_a_add_g;
wire [WIDTH-1:0] i_b_add_g;
wire [WIDTH-1:0] i_a_sub_g;
wire [WIDTH-1:0] i_b_sub_g;
wire [WIDTH-1:0] i_a_mult_g;
wire [WIDTH-1:0] i_b_mult_g;
wire [WIDTH-1:0] i_a_nand_g;
wire [WIDTH-1:0] i_b_nand_g;
wire [WIDTH-1:0] i_a_nor_g;
wire [WIDTH-1:0] i_b_nor_g;

wire [WIDTH-1:0] o_data_add_g;
wire [WIDTH-1:0] o_data_sub_g;
wire [2*WIDTH-1:0] o_data_mult_g;
wire [WIDTH-1:0] o_data_nand_g;
wire [WIDTH-1:0] o_data_nor_g;


assign i_a_add_g = i_a_g;
assign i_b_add_g = i_b_g;

assign i_a_sub_g = i_a_g;
assign i_b_sub_g = i_b_g;

assign i_a_mult_g = i_a_g;
assign i_b_mult_g = i_b_g;

assign i_a_nand_g = i_a_g;
assign i_b_nand_g = i_b_g;

assign i_a_nor_g = i_a_g;
assign i_b_nor_g = i_b_g;


assign o_data_add_g = i_a_g + i_b_g;
assign o_data_sub_g = i_a_g - i_b_g;
assign o_data_mult_g = i_a_g * i_b_g;
assign o_data_nand_g = ~(i_a_g & i_b_g);
assign o_data_nor_g = ~(i_a_g | i_b_g);

always @* begin

	case (i_sel_g) 
			3'b000: o_data_g = {4'b0000, o_data_add_g};
			3'b001: o_data_g = {4'b0000, o_data_sub_g};
			3'b010: o_data_g = o_data_mult_g;
			3'b011: o_data_g = {4'b0000, o_data_nand_g};
			3'b100: o_data_g = {4'b0000, o_data_nor_g};
			default: o_data_g = o_data_g;	
	
	endcase

end


endmodule
