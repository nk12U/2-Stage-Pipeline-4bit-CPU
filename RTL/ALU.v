module ALU(
	input  clock,
	input  reset,
	input  [7:0] D_BUS,
	input  [3:0] in_port,
	output reg cflag,
	output [3:0] A_reg_out,
	output [3:0] B_reg_out,
	output [3:0] out_port
);

	wire load_A;
	wire load_B;
	wire load_OUT;
	wire load_GPR;
	wire gprload;
	wire [1:0] mux_sel;
	alu_ctrl alu_ctrl(
		.clock(clock),
		.reset(reset),
		.D_BUS(D_BUS[7:4]),
		.load_A(load_A),
		.load_B(load_B),
		.load_OUT(load_OUT),
		.load_GPR(load_GPR),
		.gprload(gprload),
		.mux_sel(mux_sel)
	);

	wire [3:0] mux_out;
	mux4x4 mux4x4(
		.s(mux_sel),
		.a(4'b0),
		.b(A_reg_out),
		.c(B_reg_out),
		.d(in_port),
		.out(mux_out)
	);

	wire [3:0] s;
	reg cflag;
	full_adder full_adder(
		.A(mux_out),
		.B(D_BUS[3:0]),
		.cin(1'b0),
		.S(s),
		.cout(cflag)
	);

	always @(posedge clock or negedge reset)
	begin
		if(!reset)
		begin
			cflag <= 0;
		end
		else
		begin
			cflag <= cflag;
		end
	end

	wire [15:0] IN;
	demux demux(
		.IN(D_BUS[3:0]),
		.OUT(IN)
	);

	wire [15:0] gpr_mux_load_out;
	gpr_mux_load gpr_mux_load(
		.IN(IN),
		.load_GPR(load_GPR),
		.OUT(gpr_mux_load_out)
	);

	wire [3:0] q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, qa, qb, qc, qd, qe, qf;
	register16 register16(
		.reset(reset),
		.clock(clock),
		.d(B_reg_out),
		.load(gpr_mux_load_out),
		.q0(q0)
		.q1(q1)
		.q2(q2)
		.q3(q3)
		.q4(q4)
		.q5(q5)
		.q6(q6)
		.q7(q7)
		.q8(q8)
		.q9(q9)
		.qa(qa)
		.qb(qb)
		.qc(qc)
		.qd(qd)
		.qe(qe)
		.qf(qf)
	);

	wire [3:0] GPR_out;
	mux4x16 mux4x16(
		.sel(D_BUS[3:0]),
		.q0(q0),
		.q1(q1),
		.q2(q2),
		.q3(q3),
		.q4(q4),
		.q5(q5),
		.q6(q6),
		.q7(q7),
		.q8(q8),
		.q9(q9),
		.qa(qa),
		.qb(qb),
		.qc(qc),
		.qd(qd),
		.qe(qe),
		.qf(qf),
		.out(GPR_out)
	);

	wire [3:0] y;
	mux4x2 mux4x2(
		.sel(gprload),
		.A(s),
		.B(GPR_out),
		.Y(y)
	);

	register A_reg(
		.reset(reset),
		.clock(clock),
		.load(load_A),
		.d(s),
		.q(A_reg_out)
	);

	register B_reg(
		.reset(reset),
		.clock(clock),
		.load(load_B),
		.d(y),
		.q(B_reg_out)
	);

	register out_reg(
		.reset(reset),
		.clock(clock),
		.load(load_OUT),
		.d(s),
		.q(out_port)
	);

endmodule