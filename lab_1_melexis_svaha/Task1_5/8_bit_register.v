`timescale 1ns / 1ps

module reg_8bit(clk, rst_n, we_n, data_in, data_out);

input clk, rst_n, we_n;

input [7:0] data_in;

output reg [7:0] data_out;

always @(posedge clk, negedge rst_n) begin

if(!rst_n) begin

data_out <= 0;

end else if(we_n == 0) begin

data_out <= data_in;

end else if(we_n == 1) begin

data_out <= 0;

end
end

endmodule
