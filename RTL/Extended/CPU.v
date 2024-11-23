module CPU(
	input  clock,
	input  reset,
	input  [7:0] D_BUS,
	input  [3:0] in_port,
	output [11:0] address,
	output [3:0] A_reg_out,
	output [3:0] B_reg_out,
	output [3:0] out_port
);

	wire [7:0] instruction_out;
	wire cflag;

	instruction_register instruction_register(
		.reset(reset),
		.clock(clock),
		.D(D_BUS),
		.Q(instruction_out)
	);

	ALU ALU(
		.clock(clock),
		.reset(reset),
		.D_BUS(D_BUS),
		.in_port(in_port),
		.cflag(cflag),
		.A_reg_out(A_reg_out),
		.B_reg_out(B_reg_out),
		.out_port(out_port)
	);

	PCU PCU(
		.reset(reset),
		.clock(clock),
		.instruction_out(instruction_out),
		.D_BUS(D_BUS),
		.cflag(cflag),
		.address(address)
	);

endmodule
