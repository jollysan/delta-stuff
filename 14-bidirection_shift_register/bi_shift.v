parameter WIDTH=4;
//if dir, shift right(into lsb), else shift left
module bi_shift(in, reset, dir, clk, out);
	input clk, in, reset;
	output reg out;
	
	reg [WIDTH-1:0] shift = 0;
	
	always @ (posedge clk, posedge reset) begin
		if(reset)
			shift = 0;
		else begin
			if(dir) begin
				out = shift[0];		//output last bit(lsb)
				shift = shift >> 1;	//every cycle, shift 1
				shift[WIDTH-1] = in;	//input to first bit(msb)
			end
			else begin
				out = shift[WIDTH-1];	//output last bit(lsb)
				shift = shift << 1;	//every cycle, shift 1
				shift[0] = in;		//input to first bit(msb)
			end
		end
	end
	
endmodule
