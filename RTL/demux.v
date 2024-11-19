module demux(
    input  [3:0]  IN,
    output [15:0] OUT
);

    assign OUT = 16'b1 << IN; // Shift Left by IN

endmodule