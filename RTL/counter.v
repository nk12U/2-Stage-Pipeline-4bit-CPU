module counter(
    input  reset,
    input  clock,
    input  load,
    input  [11:0] d,
    output [11:0] q,
    output carry
);

    reg [11:0] s;
    
    always @(posedge clock or negedge reset)
    begin
       if(!reset)
       begin
            s <= 12'b0;
       end
       else if(load)
       begin
            s <= d;
       end
       else
       begin
            s <= s + 1'b1;
       end
    end

    assign q = s;
    assign carry = (s == 12'hFFF);

endmodule