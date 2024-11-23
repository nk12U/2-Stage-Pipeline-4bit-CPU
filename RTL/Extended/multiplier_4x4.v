module multiplier_4x4(
    input  [3:0] A,
    input  [3:0] B,
    output [7:0] Y
);

    assign Y = A * B;

endmodule