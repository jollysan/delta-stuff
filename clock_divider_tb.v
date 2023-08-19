`timescale 1ns/1ps;
module clockdivider_tb;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [3:0]divideby_2to16 //most significant 16, lsb 2

	// Instantiate the Unit Under Test (UUT)
	clockdivider uut (
		.clk(clk), 
		.count(divideby_2to16), 
		.rst(rst)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		#50 rst=1;
        
		// Add stimulus here

	end
	always
	#10 clk=~clk;
	
	initial 
	#100 $finish;
      
endmodule
