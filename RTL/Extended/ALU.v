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
	wire SUB_sel;
	wire MUL_sel;
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
	wire cflag_wire;
	wire [3:0] SUB_mux_OUT;
	full_adder full_adder(
		.A(mux_out),
		.B(SUB_mux_OUT),
		.cin(SUB_sel),
		.S(s),
		.cout(cflag_wire)
	);

	always @(posedge clock or negedge reset)
	begin
		if(!reset)
		begin
			cflag <= 0;
		end
		else
		begin
			cflag <= cflag_wire;
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
	wire [3:0] upper;
	wire loadF;
	assign loadF = MUL_sel | gpr_mux_load_out[15];
	register16 register16(
		.reset(reset),
		.clock(clock),
		.d(upper),
		.load({loadF, gpr_mux_load_out[14:0]}),
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
	mux4x2 mux4x2_1(
		.sel(gprload),
		.A(s),
		.B(GPR_out),
		.Y(y)
	);

	wire [7:0] mult_out;
	wire [3:0] bottom;
	mux4x2 mux4x2_2(
		.sel(MUL_sel),
		.A(y),
		.B(mult_out),
		.Y(bottom)
	);

	multiplier_4x4 multiplier_4x4(
		.A(A_reg_out),
		.B(B_reg_out),
		.Y(mult_out)
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
		.d(bottom),
		.q(B_reg_out)
	);

	register out_reg(
		.reset(reset),
		.clock(clock),
		.load(load_OUT),
		.d(s),
		.q(out_port)
	);

	mux4x2 mux4x2_3(
		.sel(SUB_sel),
		.A(D_BUS[3:0]),
		.B(~B_reg_out),
		.Y(SUB_mux_OUT)
	);

	mux4x2 mux4x2_4(
		.sel(MUL_sel),
		.A(B_reg_out),
		.B(mult_out),
		.Y(upper)
	);

endmodule