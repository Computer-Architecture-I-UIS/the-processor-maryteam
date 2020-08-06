module test;

	reg reset = 1;
	reg io_reset;
	reg clk = 0;
	always #5 clk = !clk;
  wire [31:0] io_out;
  
	
	TOP uut (
  			         .clock(clk),
        			   .reset(reset),
        			   .io_reset(io_reset),
						     .io_out(io_out)
						     );
		
	initial begin
		#10;
		reset = 0;
		io_reset = 1;
		#10;
		io_reset = 0;		
		
	end
	
	initial begin
	
		$dumpfile("PRUEBA.vcd");

		$dumpvars;
		#(1000);
		$finish;
	end

endmodule
