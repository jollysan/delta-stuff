parameter WIDTH = 1;

//compares 2 bits using mux
module comp_w_mux(in1, in2, eq, gr, less);
	
	input in1, in2;
	output eq, gr, less;
	
	//see if in1 is greater; in1=1, in2=0
	mux4 greater({4'b0100}, {in1, in2}, gr);
	
	//if in1 is lesser; 0-1
	mux4 lesser({4'b0010}, {in1, in2}, less);
	
	//if equal; 1-1 or 0-0
	mux4 equal({4'b1001}, {in1, in2}, eq);
	
endmodule




module mux2(in, sel, out);
	
	
	input sel;
	input [WIDTH-1:0] in[1:0];
	output [WIDTH-1:0] out;
	wire [WIDTH-1:0] w1, w2;
	wire nc_sel;
	
	

	not(nc_sel, sel);
  
	generate
		for(genvar i = 0; i < WIDTH; i = i + 1) begin
			and(w1[i], sel, in[1][i]);
			and(w2[i], nc_sel, in[0][i]);
			or(out[i], w1[i], w2[i]);
		end
	endgenerate
endmodule

//4:1 n-bit mux
module mux4(in, sel, out);
	
	
	input [WIDTH-1:0] in [3:0];
	input [1:0] sel;
	output [WIDTH-1:0] out;
	wire [WIDTH-1:0] w1, w2;
	
	mux2 m1 (in[3:2], sel[0], w1);	//mux smaller parts to mux the last 2 data
	mux2 m2 (in[1:0], sel[0], w2);	
	
	//mux last 2 data survived
	mux2 mc ({w1, w2}, sel[1], out);
	
endmodule
