module pc_ctrl(
    input  clock,
    input  reset,
    input  [7:4] D_BUS,
    input  cflag,
    output load
);

    reg [1:0] state;
    
    always @(posedge clock or negedge reset)
    begin
        if(!reset)
            state <= 2'b00;
        else
        begin
            state[0] <= ~state[0] & ~state[1] & ~D_BUS[4] & D_BUS[5] & D_BUS[6] & D_BUS[7] &  cflag;
            state[1] <= ~state[0] & ~state[1] & ~D_BUS[4] & D_BUS[5] & D_BUS[6] & D_BUS[7] & ~cflag |
                        ~state[0] & ~state[1] &  D_BUS[4] & D_BUS[5] & D_BUS[6] & D_BUS[7];
        end
    end

    assign load = state[1];

endmodule