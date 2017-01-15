`timescale 1ns / 1ps
module edge_detector(clk, n_rst, in, out);
  input clk, n_rst, in;
  output  out;
  reg in_reg;
  always @(posedge clk, negedge n_rst) begin
    if (!n_rst) begin
      in_reg <= 1'b0;
    end else begin
      in_reg <= in; 
    end
  end
  assign out = in & ~in_reg;
endmodule

