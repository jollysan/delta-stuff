parameter WIDTH = 4;


//compares if in1 is greater or lesser than in2. or equal
module comparator(in1, in2, less, great, eq);
	
	input [WIDTH-1:0] in1, in2;	//inputs
	output reg less, great, eq;	//outputs
	reg [WIDTH-1:0] wir;		//for 1 bit comparison
	reg det;			//if previous bits decided the comparison result
	
	always@(in1, in2, less, great, eq)begin	//if anything changes, not sure if outputs here are necessary
	
		det = 1'b0;	//reset previous value to start from beginning
		
		for(int i = 0; i < WIDTH; i = i + 1)begin	//msb to lsb, compare evry bit
		
			wir[WIDTH-1-i] = in1[WIDTH-1-i] ^ in2[WIDTH-1-i];	//if the bits are different
			if(wir[WIDTH-1-i] && ~det)begin	//if different, compare them
				great = in1[WIDTH-1-i];
				less = ~in1[WIDTH-1-i];
				eq = 1'b0;	//can not be equal anymore, because some bits are different
				det = 1'b1;	//the comparison result is determined, no need to compare anymore
			end
			
		end
		
		if(~det)begin	//if comparison is not determined after every bit is checked
			eq = 1'b1;	//the inputs are equal
			less = 1'b0;	//and not less or greater
			great = 1'b0;
		end
	end
	
endmodule
