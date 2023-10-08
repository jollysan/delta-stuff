module bcd_counter(clk, reset, out);
	
	input clk, reset;
	output reg [3:0] out = 4'b0000;
	
	always@(posedge clk, reset) begin
		
		if(reset)
			out = 4'b0000;
		else begin
			if(out == 4'b1001)
				out = 4'b0000;
			else
				out = out + 1;
		end
		
	end
	
endmodule
