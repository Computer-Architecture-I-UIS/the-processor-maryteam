module test;

	reg reset = 1;
	reg io_rst = 1;
		reg clk = 0;
	always #5 clk = !clk;
	wire [5:0] io_cmd;
	wire [31:0] io_imm;
	wire [31:0] io_rs1;
	wire [31:0] io_rs2;
	wire [31:0] io_rd_out;
	
	Procesador  uut (
									.clock(clk),
									.reset(reset),
									.io_rs1(io_rs1),
									.io_rs2(io_rs2),
									.io_imm(io_imm),
									.io_out(io_rd_out),
									.io_reset(io_rst)
									);
	

	
	initial begin
		#20;
		reset = 0;
		io_rst = 0;
	end
	
	initial begin
	
		$dumpfile("PRUEBA.vcd");

		$dumpvars;
		#(1000);
		$finish;
	end

endmodule
