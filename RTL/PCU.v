module PCU(
	input  reset,
	input  clock,
	input  [7:0] D_BUS,
	input  cflag,
	output [11:0] address
);

	wire [3:0] q;
	wire load;

	register register(
		.reset(reset),
		.clock(clock),
		.load(1'b1),
		.d(D_BUS[3:0]),
		.q(q)
	);

	pc_ctrl pc_ctrl(
		.clock(clock),
		.reset(reset),
		.D_BUS(D_BUS[7:4]),
		.cflag(cflag),
		.load(load)
	);

	counter counter(
		.reset(reset),
		.clock(clock),
		.load(load),
		.d({q, D_BUS[7:0]}),
		.q(address)
	);

endmodule