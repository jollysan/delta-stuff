parameter WIDTH=4;

//outputs lsb first
module piso(in, reset, sh, clk, out);
	input [WIDTH-1:0] in;
	input clk, reset, sh;
	output reg out;
	
	reg [WIDTH-1:0] shift = 0;
	
	always @ (posedge clk, posedge reset) begin
		if(reset)
			shift = 0;
		else begin
			if(sh)begin	//if shift, shift
				shift = shift >> 1;	//every cycle, shift 1
        shift[WIDTH-1] = in[WIDTH-1];	//input to first bit(msb). if not this command, it loads 0 to msb, this is my choice
				
			end
			else begin	//if not shift, load new data into all registers
				shift = in;
			end
			
			out = shift[0];		//output
		end
	end
	
endmodule
