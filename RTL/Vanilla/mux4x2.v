module mux4x2(
    input  sel,
    input  [3:0] A,
    input  [3:0] B,
    output [3:0] Y
);

    assign Y = sel ? B : A;

endmodule