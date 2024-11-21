module register(
    input  reset,
    input  clock,
    input  load,
    input  [3:0] d,
    output [3:0] q
);

    reg [3:0] s;
    
    always @(posedge clock or negedge reset)
    begin
        if (!reset)
        begin
            s <= 4'b0;
        end 
        else if(load)
        begin
            s <= d;
        end
        else
        begin
            s <= s;
        end
    end
    
    assign q = s;

endmodule