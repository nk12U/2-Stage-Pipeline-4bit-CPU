module register16(
    input  reset,
    input  clock,
    input  [3:0] d,
    input  [15:0] load,
    output [3:0] q0,
    output [3:0] q1,
    output [3:0] q2,
    output [3:0] q3,
    output [3:0] q4,
    output [3:0] q5,
    output [3:0] q6,
    output [3:0] q7,
    output [3:0] q8,
    output [3:0] q9,
    output [3:0] qa,
    output [3:0] qb,
    output [3:0] qc,
    output [3:0] qd,
    output [3:0] qe,
    output [3:0] qf
);

    register gpreg0(
        .reset(reset),
        .clock(clock),
        .load(load[0]),
        .d(d),
        .q(q0)
    );

    register gpreg1(
        .reset(reset),
        .clock(clock),
        .load(load[1]),
        .d(d),
        .q(q1)
    );

    register gpreg2(
        .reset(reset),
        .clock(clock),
        .load(load[2]),
        .d(d),
        .q(q2)
    );

    register gpreg3(
        .reset(reset),
        .clock(clock),
        .load(load[3]),
        .d(d),
        .q(q3)
    );

    register gpreg4(
        .reset(reset),
        .clock(clock),
        .load(load[4]),
        .d(d),
        .q(q4)
    );

    register gpreg5(
        .reset(reset),
        .clock(clock),
        .load(load[5]),
        .d(d),
        .q(q5)
    );

    register gpreg6(
        .reset(reset),
        .clock(clock),
        .load(load[6]),
        .d(d),
        .q(q6)
    );

    register gpreg7(
        .reset(reset),
        .clock(clock),
        .load(load[7]),
        .d(d),
        .q(q7)
    );

    register gpreg8(
        .reset(reset),
        .clock(clock),
        .load(load[8]),
        .d(d),
        .q(q8)
    );

    register gpreg9(
        .reset(reset),
        .clock(clock),
        .load(load[9]),
        .d(d),
        .q(q9)
    );

    register gpregA(
        .reset(reset),
        .clock(clock),
        .load(load[10]),
        .d(d),
        .q(qa)
    );

    register gpregB(
        .reset(reset),
        .clock(clock),
        .load(load[11]),
        .d(d),
        .q(qb)
    );

    register gpregC(
        .reset(reset),
        .clock(clock),
        .load(load[12]),
        .d(d),
        .q(qc)
    );

    register gpregD(
        .reset(reset),
        .clock(clock),
        .load(load[13]),
        .d(d),
        .q(qd)
    );

    register gpregE(
        .reset(reset),
        .clock(clock),
        .load(load[14]),
        .d(d),
        .q(qe)
    );

    register gpregF(
        .reset(reset),
        .clock(clock),
        .load(load[15]),
        .d(d),
        .q(qf)
    );

endmodule