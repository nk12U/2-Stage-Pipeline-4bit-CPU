module gpr_mux_load(
    input  [15:0] IN,
    input  load_GPR,
    output [15:0] OUT
);

    assign OUT = load_GPR ? IN : 16'b0;

endmodule