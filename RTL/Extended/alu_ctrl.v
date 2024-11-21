module alu_ctrl(
    input  clock,
    input  reset,
    input  [7:4] D_BUS,
    output load_A,
    output load_B,
    output load_OUT,
    output load_GPR,
    output gprload,
    output [1:0] mux_sel
);

    reg state;

    always @(posedge clock or negedge reset)
    begin
        if(!reset)begin
            state <= 1'b0;
        end
        else begin
            state <= ~state & D_BUS[5] & D_BUS[6] & D_BUS[7];
        end
    end

    assign load_A     = ~state & ~D_BUS[6] & ~D_BUS[7] |
                        ~state & ~D_BUS[4] & ~D_BUS[5] &  D_BUS[6] &  D_BUS[7];
    assign load_B     = ~state &  D_BUS[6] & ~D_BUS[7] |
                        ~state & ~D_BUS[4] &  D_BUS[5] & ~D_BUS[6] &  D_BUS[7] |
                        ~state &  D_BUS[4] & ~D_BUS[5] &  D_BUS[6] &  D_BUS[7];
    assign load_OUT   = ~state & ~D_BUS[5] & ~D_BUS[6] &  D_BUS[7];
    assign load_GPR   = ~state &  D_BUS[4] &  D_BUS[5] & ~D_BUS[6] &  D_BUS[7];
    assign gprload    = ~state & ~D_BUS[4] &  D_BUS[5] & ~D_BUS[6] &  D_BUS[7];
    assign SUB_sel    = ~state & ~D_BUS[4] & ~D_BUS[5] &  D_BUS[6] &  D_BUS[7];
    assign MUL_sel    = ~state &  D_BUS[4] & ~D_BUS[5] &  D_BUS[6] &  D_BUS[7];
    assign mux_sel[0] = ~state &  D_BUS[4] & ~D_BUS[6] & ~D_BUS[7] |
                        ~state &  D_BUS[5] &  D_BUS[6] & ~D_BUS[7] |
                        ~state & ~D_BUS[4] & ~D_BUS[5] &  D_BUS[6] &  D_BUS[7];
    assign mux_sel[1] = ~state &  D_BUS[5] & ~D_BUS[6] & ~D_BUS[7] |
                        ~state &  D_BUS[4] &  D_BUS[6] & ~D_BUS[7] |
                        ~state &  D_BUS[4] & ~D_BUS[6] &  D_BUS[7];

endmodule