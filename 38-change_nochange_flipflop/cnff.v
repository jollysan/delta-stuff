module cnff(c, n, clk, out);
	input c, n, clk;
	output reg out = 0;
	
	wire pre_out;
	wire resc;	//result of c mux
	
	mux2 c_mux(0, !out, c, resc);
	mux2 n_mux(out, resc, n, pre_out);//(result of c) or (no change)
	
	
	//d flip flop
	always @ (posedge clk) begin
		
		out = pre_out;	//output the calculated value at posedge
		
	end



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
