module alu_ctrl(
    input  clock,
    input  reset,
    input  D_BUS_4,
    input  D_BUS_5,
    input  D_BUS_6,
    input  D_BUS_7,
    output load_A,
    output load_B,
    output load_OUT,
    output load_GPR,
    output gprload,
    output mux_sel_0,
    output mux_sel_1
);
    reg state;

    // 順序回路
    always @(posedge clock or negedge reset)begin // 非同期負論理リセット
        if(!reset)begin
            state <= 1'b0;
        end
        else begin
            state <= ~state & D_BUS_5 & D_BUS_6 & D_BUS_7;
        end
    end

    // 組み合わせ回路
    assign load_A    = ~state & ~D_BUS_6 & ~D_BUS_7;
    assign load_B    = ~state &  D_BUS_6 & ~D_BUS_7 |
                       ~state & ~D_BUS_4 &  D_BUS_5 & ~D_BUS_6 &  D_BUS_7;
    assign load_OUT  = ~state & ~D_BUS_5 & ~D_BUS_6 &  D_BUS_7;
    assign load_GPR  = ~state &  D_BUS_4 &  D_BUS_5 & ~D_BUS_6 &  D_BUS_7;
    assign gprload   = ~state & ~D_BUS_4 &  D_BUS_5 & ~D_BUS_6 &  D_BUS_7;

    assign mux_sel_0 = ~state &  D_BUS_4 & ~D_BUS_6 & ~D_BUS_7 |
                       ~state &  D_BUS_5 &  D_BUS_6 & ~D_BUS_7;

    assign mux_sel_1 = ~state &  D_BUS_5 & ~D_BUS_6 & ~D_BUS_7 |
                       ~state &  D_BUS_4 &  D_BUS_6 & ~D_BUS_7 |
                       ~state &  D_BUS_4 & ~D_BUS_6 &  D_BUS_7;

endmodule