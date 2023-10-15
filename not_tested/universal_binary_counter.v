parameter WIDTH = 4;

module ubc(in, clk, rst, enable, isUp, out);
	
	input rst, clk, enable, isUp, load;
	input [WIDTH-1:0] in;
	output reg [WIDTH-1:0] out = 0;
	
	always @(posedge clk, rst) begin
		
		if(rst)
			out = 0;
		
		else begin
			if(load)
				out = in;
			
			else begin
				if(enable) begin	//enabled
					if(isUp)	//if up
						out = out + 1;
					else		//or down
						out = out - 1;
				end
			end
		end
	end
	
	
	
endmodule
