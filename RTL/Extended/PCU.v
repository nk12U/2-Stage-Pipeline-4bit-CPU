module PCU(
	input  reset,
	input  clock,
	input  [7:0] instruction_out,
	input  [7:0] D_BUS,
	input  cflag,
	output [11:0] address
);

	wire load;

	pc_ctrl pc_ctrl(
		.clock(clock),
		.reset(reset),
		.D_BUS(instruction_out[7:4]),
		.cflag(cflag),
		.load(load)
	);

	counter counter(
		.reset(reset),
		.clock(clock),
		.load(load),
		.d({instruction_out[3:0], D_BUS[7:0]}),
		.q(address)
	);

endmodule