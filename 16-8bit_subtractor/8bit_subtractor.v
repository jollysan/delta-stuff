module cla_4bit (a, b, cin, sum, cout);	//the exact code of 4bit cla from before
	input [3:0] a, b;
	input cin;
	output [3:0] sum;
	output cout;
	wire [3:0] P;
	wire [3:0] G;
	wire [2:0] C;


	generate
		for(genvar i = 0; i < 4; i = i + 1) begin
			and (G[i], a[i], b[i]);
			xor (P[i], a[i], b[i]);
		end
		
		xor (sum[0], P[0], cin);
		
		for(genvar i = 1; i < 4; i = i + 1) begin
			xor (sum[i], P[i], C[i-1]);
		end
		
	endgenerate



assign C[0] = G[0] | (P[0] & cin);
assign C[1] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & cin);
assign C[2] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & cin);
assign cout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & cin);

endmodule


module subtract_8bit (a, b, result);

	input [7:0] a, b;
	output [7:0] result;
	
	wire [7:0] result;
	wire [7:0] neg_b;	//negative of b according to 2's complement
	wire carry[1:0];	//carry[1] doesnt do anything, carry[0] connects two 4bit adders

	assign neg_b = ~b + 1;	//negate the bits and add 1, 2's complement

										//adding with negated value of b is the same as subtracting b; a - b = a + (-b). 
	cla_4bit lsbs (a[3:0], neg_b[3:0], 1'b0, result[3:0], carry[0]);	//add least significant bits of a and negated b
	cla_4bit msbs (a[7:4], neg_b[7:4], carry[0], result[7:4], carry[1]);	//add most significant bits
endmodule
