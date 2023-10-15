parameter WIDTH=4;

module shifts(in, clk, type, out);

	input [WIDTH-1:0] in;
	input [2:0] type;
	output reg [WIDTH-1:0] out;
	
	//type[0] represents the direction; 1 for right(into lsb), 0 for left
	//type[1] represents logical or algebraic; 1 for logical, 0 for algebraic
	//type[2] represents rotate; 1 for rotate, 0 for others
	
	always @ (posedge clk) begin
		
		//if rotate
		if(type[2]) begin
			if(type[0])	//rotate right
				out = {in[0], in[WIDTH-1:1]};
			else		//rotate left
				out = {in[WIDTH-2:0], in[WIDTH-1]};
		end
		
		//if not rotate
		else begin
			//first check the direction
			if(!type[0])	//if left, logical or algebraic does not matter
				out = {in[WIDTH-2:0], 1'b0};
			else begin	//if right
				if(type[1])	//if logical right
					out = {1'b0, in[WIDTH-1:1]};
					
				else		//if algebraic right 
					out = {in[WIDTH-1], in[WIDTH-1:1]};
			end
		end
	end
endmodule
