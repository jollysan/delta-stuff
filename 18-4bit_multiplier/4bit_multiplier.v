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


module mult_4bit (a, b, result);
	
	input [3:0] a, b;       // 4-bit input operands
	output [7:0] result;    // 8-bit output result
	
	wire [3:0] and1, and2, and3, and4; // Wires for the AND gate outputs
	wire [2:0] carry;       // Carry signals for the carry-lookahead adders
	wire [3:0] sum1, sum2, sum3; // Wires for the adder sum outputs

	// Generate AND gate outputs for each bit pair
	generate
		for (genvar i = 0; i < 4; i = i + 1) begin
			and (and1[i], a[i], b[0]);
			and (and2[i], a[i], b[1]);
			and (and3[i], a[i], b[2]);
			and (and4[i], a[i], b[3]);
		end
	endgenerate

	// Carry-lookahead adder instances
	cla_4bit add1 ({1'b0, and1[3:1]}, and2, 0, sum1, carry[0]);
	cla_4bit add2 (and3, {carry[0] , sum1[3:1]}, 0, sum2, carry[1]);
	cla_4bit add3 (and4, {carry[1] , sum2[3:1]}, 0, sum3, carry[2]);

	// Assign the result, including carry bits
  assign result = {carry[2], sum3, sum2[0], sum1[0], and1[0]};

endmodule
