module mux4x4(
    input  [1:0] s,
    input  [3:0] a,
    input  [3:0] b,
    input  [3:0] c,
    input  [3:0] d,
    output [3:0] out
);

    assign out = (s == 2'b00) ? a 
               : (s == 2'b01) ? b 
               : (s == 2'b10) ? c
               : d;

endmodule