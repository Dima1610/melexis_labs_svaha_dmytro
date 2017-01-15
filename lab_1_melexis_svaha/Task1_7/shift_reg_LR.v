`timescale 1ns / 1ps

module param_shift_reg_LR(clk, rst_n, data_in, data_out, vector);

parameter width = 8;


input clk, rst_n, vector;

input data_in; //serial loading

output reg [width-1:0] data_out;

always @(posedge clk, negedge rst_n) begin

if(!rst_n) begin

data_out <= 0;

end
else if (vector == 0) begin

data_out <= {data_in, data_out[width-1:width-7]};

end

else if(vector == 1) begin

data_out <= {data_out[width-2:0], data_in};

end
end

endmodule
