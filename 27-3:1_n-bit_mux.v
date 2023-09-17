parameter WIDTH = 1;

//n-bit data, 2x1 mux
module mux2(in, sel, out);
	
	
	input sel;		//selection
	input [WIDTH-1:0] in[1:0];	//inputs, 2- 8bit inputs
	output [WIDTH-1:0] out;	//8bit output
	wire [WIDTH-1:0] w1, w2;	//to connect gates
	wire nc_sel;		//negative of selection
	
	

	not(nc_sel, sel);
  
	generate
    //generate mux for every bit (WIDTH, 1 for this task)
		for(genvar i = 0; i < WIDTH; i = i + 1) begin
			and(w1[i], sel, in[1][i]);
			and(w2[i], nc_sel, in[0][i]);
			or(out[i], w1[i], w2[i]);
		end
	endgenerate
	
	//this assign command does the same thing as the generate block above,
	//but i like the gates more
	//assign out = (sel) ? in[1] : in[0];
endmodule

//3:1 n-bit mux
module mux3(in, sel, out);
	
	
	input [WIDTH-1:0] in [2:0];
	input [1:0] sel;
	output [WIDTH-1:0] out;
	wire [WIDTH-1:0] w1, w2;
	
	mux2 m2 (in[1:0], sel[0], w2);	//mux to output if sel[1] is 0
	
	
	mux2 mc ({in[2], w2}, sel[1], out);	//if sel[1] is 1, in[2] is out. else the output from in[0]'s mux is out
	
endmodule
