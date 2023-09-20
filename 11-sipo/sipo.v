parameter WIDTH=4;

module sipo(in, reset, clk, out);
	input clk, in, reset;
	output reg [WIDTH-1:0] out;
	
	reg [WIDTH-1:0] shift = 0;
	
	always @ (posedge clk, posedge reset) begin
		if(reset)
			shift = 0;
		else begin

			shift = shift >> 1;	//every cycle, shift 1
			shift[WIDTH-1] = in;	//input to first bit(msb)
			out = shift;		//output all the bits
		end
	end
	
endmodule
