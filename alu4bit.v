module alu4bit(
    input [3:0] A,
    input [3:0] B,
    input [2:0] sel,
    output reg [3:0] Y,
    output reg Carry,
    output reg Zero
);
localparam ADD = 3'b000,
           SUB = 3'b001,
           AND_OP = 3'b010,
           OR_OP  = 3'b011,
           XOR_OP = 3'b100,
           NOT_OP = 3'b101,
           SHL    = 3'b110,
           SHR    = 3'b111;
always @(*) begin
    Carry = 0;
    Y = 0;
    case(sel)
        ADD: begin
            {Carry,Y} = A + B;
        end
        SUB: begin
            {Carry,Y} = A - B;
        end
        AND_OP: begin
            Y = A & B;
        end
        OR_OP: begin
            Y = A | B;
        end
        XOR_OP: begin
            Y = A ^ B;
        end
        NOT_OP: begin
            Y = ~A;
        end
        SHL: begin
            Carry = A[3];
            Y = A << 1;
        end
        SHR: begin
            Carry = A[0];
            Y = A >> 1;
        end
        default: begin
            Carry = 0;
            Y = 0;
        end
    endcase
    Zero = (Y == 4'b0000);
end
endmodule