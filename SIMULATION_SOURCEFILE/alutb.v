`timescale 1ns/1ps

module alu_tb;

reg clk;
reg rst;

reg [3:0] A;
reg [3:0] B;

wire [2:0] sel;
wire [3:0] Y;
wire Carry;
wire Zero;

// Counter
mod8_counter counter(
    .clk(clk),
    .rst(rst),
    .sel(sel)
);

// ALU
alu4bit DUT(
    .A(A),
    .B(B),
    .sel(sel),
    .Y(Y),
    .Carry(Carry),
    .Zero(Zero)
);

// Clock Generation
always #5 clk = ~clk;

initial begin

    $dumpfile("alu.vcd");
    $dumpvars(0,alu_tb);

    clk = 0;
    rst = 1;

    A = 4'b1010;
    B = 4'b0011;

    #10 rst = 0;

    // Run through all 8 operations
    #80;

    A = 4'b1110;
    B = 4'b1011;

    // Run through all 8 operations again
    #80;

    $finish;

end

initial begin
    $monitor("Time=%0t  SEL=%b  A=%b  B=%b  Y=%b  Carry=%b  Zero=%b",
              $time,sel,A,B,Y,Carry,Zero);
end

endmodule