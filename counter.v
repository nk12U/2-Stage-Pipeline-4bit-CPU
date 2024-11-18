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
    assign carry = (s == 12'hFFF); // 16進数で4095のときキャリー生成

endmodule

// 以下は，count1を使った場合の実装

//     // キャリー信号
//     wire [11:0] c;

//     count1 c0(
//         // .内部信号名(外部信号名)
//         .cin(1'b1),
//         .d(d[0]),
//         .reset(reset),
//         .clock(clock),
//         .load(load),
//         .q(q[0]),
//         .cout(c[0])
//     );
    
//     count1 c1(
//         .cin(c[0]),
//         .d(d[1]),
//         .reset(reset),
//         .clock(clock),
//         .load(load),
//         .q(q[1]),
//         .cout(c[1])
//     );

//     count1 c2(
//         .cin(c[1]),
//         .d(d[2]),
//         .reset(reset),
//         .clock(clock),
//         .load(load),
//         .q(q[2]),
//         .cout(c[2])
//     );

//     count1 c3(
//         .cin(c[2]),
//         .d(d[3]),
//         .reset(reset),
//         .clock(clock),
//         .load(load),
//         .q(q[3]),
//         .cout(c[3])
//     );

//     count1 c4(
//         .cin(c[3]),
//         .d(d[4]),
//         .reset(reset),
//         .clock(clock),
//         .load(load),
//         .q(q[4]),
//         .cout(c[4])
//     );

//     count1 c5(
//         .cin(c[4]),
//         .d(d[5]),
//         .reset(reset),
//         .clock(clock),
//         .load(load),
//         .q(q[5]),
//         .cout(c[5])
//     );

//     count1 c6(
//         .cin(c[5]),
//         .d(d[6]),
//         .reset(reset),
//         .clock(clock),
//         .load(load),
//         .q(q[6]),
//         .cout(c[6])
//     );

//     count1 c7(
//         .cin(c[6]),
//         .d(d[7]),
//         .reset(reset),
//         .clock(clock),
//         .load(load),
//         .q(q[7]),
//         .cout(c[7])
//     );

//     count1 c8(
//         .cin(c[7]),
//         .d(d[8]),
//         .reset(reset),
//         .clock(clock),
//         .load(load),
//         .q(q[8]),
//         .cout(c[8])
//     );

//     count1 c9(
//         .cin(c[8]),
//         .d(d[9]),
//         .reset(reset),
//         .clock(clock),
//         .load(load),
//         .q(q[9]),
//         .cout(c[9])
//     );

//     count1 c10(
//         .cin(c[9]),
//         .d(d[10]),
//         .reset(reset),
//         .clock(clock),
//         .load(load),
//         .q(q[10]),
//         .cout(c[10])
//     );

//     count1 c11(
//         .cin(c[10]),
//         .d(d[11]),
//         .reset(reset),
//         .clock(clock),
//         .load(load),
//         .q(q[11]),
//         .cout(carry)
//     );

// endmodule