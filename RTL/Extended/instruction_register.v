module instruction_register(
    input  reset,
    input  clock,
    input  [7:0] D,
    output [7:0] Q
);

    register instruction_register1(
        .reset(reset),
        .clock(clock),
        .load(1'b1),
        .d(D[3:0]),
        .q(Q[3:0])
    );

    register instruction_register2(
        .reset(reset),
        .clock(clock),
        .load(1'b1),
        .d(D[7:4]),
        .q(Q[7:4])
    );

endmodule