parameter WIDTH=4;

module ripple_adder(a, b, sum, cin, cout);
	
	input [WIDTH-1:0] a, b;
	input cin;
	output [WIDTH-1:0] sum;
	output cout;
	
	
	wire [WIDTH  :0] carry;	//1 bit wider to also have carry in
	wire [WIDTH-1:0] xab;
	wire [WIDTH-1:0] an1;
	wire [WIDTH-1:0] an2;
	
	assign carry[0] = cin;
	assign cout = carry[WIDTH];
	
	generate
		for(genvar i = 0; i < WIDTH; i = i + 1) begin
			
			xor(xab[i], a[i], b[i]);
			xor(sum[i], xab[i], carry[i]);
			
			and(an1[i], xab[i], carry[i]);
			and(an2[i], a[i], b[i]);
			
			or(carry[i+1], an1[i], an2[i]);
			
		end
	endgenerate
	
	
	
	
endmodule


//n-bit data, 2x1 mux
module mux2(in, sel, out);
	
	
	input sel;			//selection
	input [WIDTH-1:0] in[1:0];	//inputs, 2- nbit inputs
	output [WIDTH-1:0] out;		//output
	wire [WIDTH-1:0] w1, w2;	//to connect gates
	wire nc_sel;			//negative of selection
	
	

	not(nc_sel, sel);
  
	generate
		//generate mux for every bit (WIDTH bits here)
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



module carry_select_adder(in1, in2, out, cin, cout);
	
	input [WIDTH-1:0] in1, in2;
	input cin;
	output [WIDTH-1:0] out;
	output cout;
	
	wire [WIDTH-1:0] sum1, sum2;
	wire carry1, carry2;
	
	
	//2 adders to calculate both scenarios
	ripple_adder add1 (in1, in2, sum1, 1'b1, carry1);
	ripple_adder add2 (in1, in2, sum2, 1'b0, carry2);
	
	//select one of the sums calculated based on carry-in input
	mux2 sele ({sum1, sum2}, cin, out);	//if cin, output sum1(which carry bit is 1), else output sum2
	
	//also select carry output
	assign cout = (cin) ? carry1 : carry2;
	
	
endmodule
