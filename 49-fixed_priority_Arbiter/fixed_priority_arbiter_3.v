// in1 has the highest priority, in3 has lowest
module fix_arbit(in1, in2, in3, out1, out2, out3, clk);

	input in1, in2, in3, clk;
	output reg out1, out2, out3;
	
	
	always @(posedge clk) begin
		
		if(in1)	//start checking from highest priority. if higher priority one is present, no need to check others
			{out1, out2, out3} = 3'b100;
		else if(in2)
			{out1, out2, out3} = 3'b010;
		else if(in3)
			{out1, out2, out3} = 3'b001;
		else
			{out1, out2, out3} = 3'b000;
		
	end
	
endmodule
