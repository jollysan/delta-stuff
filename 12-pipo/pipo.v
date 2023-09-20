parameter WIDTH=4;

//outputs lsb first
module pipo(in, reset, sh, clk, out);
	input [WIDTH-1:0] in;
	input clk, reset, sh;
	output reg [WIDTH-1:0] out;
	
	reg [WIDTH-1:0] shift = 0;
	
	always @ (posedge clk, posedge reset) begin
		if(reset)
			shift = 0;
		else begin
			if(sh)begin	//if shift, shift
				shift = shift >> 1;	//every cycle, shift 1
			end
			else begin	//if not shift, load new data
				shift = in;
			end
			
			out = shift;		//output
		end
	end
	
endmodule
