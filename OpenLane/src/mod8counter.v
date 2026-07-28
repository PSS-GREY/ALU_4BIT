module mod8_counter(
    input clk,
    input rst,
    output reg [2:0] sel
);

always @(posedge clk or posedge rst)
begin
    if(rst)
        sel <= 3'b000;
    else
        sel <= sel + 1'b1;
end

endmodule