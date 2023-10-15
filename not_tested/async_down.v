module asynch_down_counter(rst, clk, q);
	
	input clk, rst;
	
	output reg [3:0] q;
	
	wire [3:0] q, nq;
	wire reset;
	
	mux2 m0(1, 0, rst, reset); //if rsst is 1, reset is 0 and resets flip flops
	
	//the rst can be directly connected to the flip flops as !rst
	//but i did it with a mux
	
	jkff ff1(reset, 1'b1, clk, q[0], nq[0]);
	jkff ff1(reset, 1'b1, nq[0], q[1], nq[1]);
	jkff ff1(reset, 1'b1, nq[1], q[2], nq[2]);
	jkff ff1(reset, 1'b1, nq[2], q[3], nq[3]);
	
	
	
	
endmoudle



module jkff(j, k, clk, q, nq);
	
	input j, k, clk;
	output reg q = 0;
	output reg nq = 1;
	
	
	always @ (clk) begin
		
		if(j && !k) begin
			q <= 1;
			nq <= 0;
		end
		else if(!j && k) begin
			q <= 0;
			nq <= 1;
		end
		else if(j && k) begin
			q <= nq;
			nq <= q;
		end
		//else nothing changes(!j && !q)
		
		
	end
	
endmodule

//n-bit data, 2x1 mux
module mux2(in1, in2, sel, out);
	parameter WIDTH = 1;
		
	input sel;		//selection
	input [WIDTH-1:0] in1, in2;	//inputs
	output [WIDTH-1:0] out;	//output
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
