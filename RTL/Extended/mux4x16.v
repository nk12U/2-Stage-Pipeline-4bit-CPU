module mux4x16(
    input  [3:0] sel,
    input  [3:0] q0,
    input  [3:0] q1,
    input  [3:0] q2,
    input  [3:0] q3,
    input  [3:0] q4,
    input  [3:0] q5,
    input  [3:0] q6,
    input  [3:0] q7,
    input  [3:0] q8,
    input  [3:0] q9,
    input  [3:0] qa,
    input  [3:0] qb,
    input  [3:0] qc,
    input  [3:0] qd,
    input  [3:0] qe,
    input  [3:0] qf,
    output [3:0] out
);

    assign out = (sel == 4'b0000) ? q0 
               : (sel == 4'b0001) ? q1 
               : (sel == 4'b0010) ? q2
               : (sel == 4'b0011) ? q3
               : (sel == 4'b0100) ? q4
               : (sel == 4'b0101) ? q5
               : (sel == 4'b0110) ? q6
               : (sel == 4'b0111) ? q7
               : (sel == 4'b1000) ? q8
               : (sel == 4'b1001) ? q9
               : (sel == 4'b1010) ? qa
               : (sel == 4'b1011) ? qb
               : (sel == 4'b1100) ? qc
               : (sel == 4'b1101) ? qd
               : (sel == 4'b1110) ? qe
               : qf;

endmodule