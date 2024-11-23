module full_adder(
    input  [3:0] A,
    input  [3:0] B,
    input  cin,
    output [3:0] S,
    output cout,
);

    assign {cout, S} = A + B + cin;

endmodule