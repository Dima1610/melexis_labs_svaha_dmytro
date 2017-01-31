`timescale 1ns / 1ps
module full_adder_4bit_tb;
parameter WIDTH = 4;


reg [WIDTH-1:0] i_a, i_b;
reg i_c;

wire o_pi;
wire [WIDTH-1:0] o_s;

full_adder_4bit fa_tb(
.i_a(i_a),
.i_b(i_b),
.i_c(i_c),
.o_pi(o_pi),
.o_s(o_s)
);


initial begin

i_a = 4'b0000;
i_b = 4'b0000;
i_c = 1'b0;



repeat (20) begin 
#10 i_a = $random();
 i_b = $random();
end

 $finish;

end



endmodule
