
module dff_wmux(d, clk, out);
	input d, clk;
	output out;
	
	wire o1, o2;	//the values the circuit holds
	
	
	mux2 mx1(o1, d, clk, o1);	//first mux that selects between current value and d input
	mux2 mx2(o2, o1, !clk, o2);	//second mux to output held value next or current output
	
	assign out = o2;


endmodule


//n-bit data, 2x1 mux
module mux2(in1, in2, sel, out);
	parameter WIDTH = 1;
		
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
