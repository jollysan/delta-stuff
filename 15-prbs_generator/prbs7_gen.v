`timescale 1ns / 1ps
module prbs7_gen (prbs, clk, rst 
);
	input clk, rst;
	output wire prbs;
	reg [6:0] shift_register; //register series to work on
  
	always @(posedge clk or posedge rst) begin //whenever reset is given, reset regardless of clock state
		if (rst) begin
			shift_register <= 7'b1101100; //initialise to this seed when reset
		end
    
		else begin
			//pseudorandom generation of the output bit and next states by shifting and xor-ing
			shift_register <= {shift_register[0] ^ shift_register[1], shift_register[6:1]};
		end
    
	end
  
	assign prbs = shift_register[0];	//output the pseudorandom bit generated
  
endmodule
