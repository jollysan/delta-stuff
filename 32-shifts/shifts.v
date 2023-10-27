parameter WIDTH=4;

module shifts(in, clk, op, out);

	input [WIDTH-1:0] in;
	input clk;
	input [2:0] op;
	output reg [WIDTH-1:0] out = 0;
	
	//op[0] represents the direction; 0 for right(into lsb), 1 for left
	//op[1] represents logical or algebraic; 1 for logical, 0 for algebraic
	//op[2] represents rotate; 1 for rotate, 0 for others
	
	always @ (posedge clk) begin
		
		//if rotate
		if(op[2]) begin
			if(op[0])	//rotate left
				out = {in[WIDTH-2:0], in[WIDTH-1]};
			else		//rotate right
				out = {in[0], in[WIDTH-1:1]};
		end
		
		//if not rotate
		else begin
			//first check the direction
			if(op[0])	//if left, logical or algebraic does not matter
				out = {in[WIDTH-2:0], 1'b0};
			else begin	//if right
				if(op[1])	//if logical right
					out = {1'b0, in[WIDTH-1:1]};
					
				else		//if algebraic right 
					out = {in[WIDTH-1], in[WIDTH-1:1]};
			end
		end
	end
endmodule
