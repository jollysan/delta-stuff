
parameter WIDTH = 8;


module barrel_shift(in, out, count);
	input [7:0] in;
	input [2:0] count;
	output [7:0] out;
	
	wire [7:0] w1, w2, w3;	//to stack the shifts
	
	mux2 m1(in, {4'b000, in[7:4]}, count[2], w1);	//shift 4 bits
	mux2 m2(w1, {2'b00, w1[7:2]}, count[1], w2);	//shift 2 bits
	mux2 m3(w2, {1'b0, w2[7:1]}, count[0], w3);	//shift 1 bit
	
	//if shift count is given 3'b111, then shifts in every mux and total of 7 bits
	
	assign out = w3;
	
endmodule




//n-bit data, 2x1 mux
module mux2(in1, in2, sel, out);
	
	
	input sel;		//selection
	input [WIDTH-1:0] in1, in2;	//inputs, 2- 8bit inputs
	output [WIDTH-1:0] out;	//8bit output
	wire [WIDTH-1:0] w1, w2;	//to connect gates
	wire nc_sel;		//negative of selection
	
	

	not(nc_sel, sel);
  
	generate
		//generate mux for every bit (WIDTH bits here)
		for(genvar i = 0; i < WIDTH; i = i + 1) begin
			and(w1[i], nc_sel, in1[i]);
			and(w2[i], sel, in2[i]);
			or(out[i], w1[i], w2[i]);
		end
	endgenerate
endmodule
