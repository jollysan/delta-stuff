parameter WIDTH=4;

module siso(in, reset, clk, out);
	input clk, in, reset;
	output reg out;
	
	reg [WIDTH-1:0] shift = 0;
	
	always @ (posedge clk, posedge reset) begin
		if(reset)
			shift = 0;
		else begin
			shift = shift >> 1;	//every cycle, shift 1
			shift[WIDTH-1] = in;	//input to first bit(msb)
			out = shift[0];		//output last bit(lsb)
		end
	end
	
endmodule
