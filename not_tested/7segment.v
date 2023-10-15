module bcd_7segment(in, out);
	
	input [3:0] in;		//input
	output reg [6:0] out;	//segments
	
	always @(in) begin
		
		if(in == 4'b0000)
			out = 7'b1111110;
		else if(in == 4'b0001)
			out = 7'b0110000;
		else if(in == 4'b0010)
			out = 7'b1101101;
		else if(in == 4'b0011)
			out = 7'b1111001;
		else if(in == 4'b0100)
			out = 7'b0110011;
		else if(in == 4'b0101)
			out = 7'b1011011;
		else if(in == 4'b0110)
			out = 7'b1011111;
		else if(in == 4'b0111)
			out = 7'b1110000;
		else if(in == 4'b1000)
			out = 7'b1111111;
		else if(in == 4'b1001)
			out = 7'b1111011;
	end
	
	
	
	
endmodule
