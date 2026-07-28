module alu_top(
    input clk,
    input rst,
    input [3:0] A,
    input [3:0] B,

    output [3:0] Y,
    output Carry,
    output Zero
);

wire [2:0] sel;

mod8_counter counter(
    .clk(clk),
    .rst(rst),
    .sel(sel)
);

alu4bit alu(
    .A(A),
    .B(B),
    .sel(sel),
    .Y(Y),
    .Carry(Carry),
    .Zero(Zero)
);

endmodule