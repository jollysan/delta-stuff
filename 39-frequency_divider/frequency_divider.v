parameter N = 3;

module freq_div(clk, out);
	input clk;
	output reg out = 0;
	
	reg [$clog2(N)-1:0] counter = 0;
	
	always @(edge clk) begin
		
		if(counter == N) begin
			counter = 0;
			out = ~out;
		end
		else
			counter = counter + 1;
		
	end
endmodule
