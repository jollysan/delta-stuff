
module cla_4bit (a, b, cin, sum, cout);	//4bit cla
	input [3:0] a, b;
	input cin;
	output [3:0] sum;
	output cout;
	wire [3:0] P;
	wire [3:0] G;
	wire [2:0] C;


	generate
		for(genvar i = 0; i < 4; i = i + 1) begin
      and (G[i], a[i], b[i]);  //"and" and "xor" all bits
			xor (P[i], a[i], b[i]);
		end

    //xor propagates and carries
		xor (sum[0], P[0], cin);
		for(genvar i = 1; i < 4; i = i + 1) begin
			xor (sum[i], P[i], C[i-1]);
		end
		
	endgenerate


//determine carry values
assign C[0] = G[0] | (P[0] & cin);
assign C[1] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & cin);
assign C[2] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & cin);
assign cout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & cin);

endmodule

//has no carry output, but can be implemented (has inside wire not connected to any output, carry[1])
module add_sub_8bit (a, b, sel,result);

	input [7:0] a, b;
	input sel;
	output [7:0] result;
	
	wire [7:0] result;
	wire [7:0] next_b;	//value to be worked on after determining subtraction or addition
	wire carry[1:0];	//carry[1] doesnt do anything, carry[0] connects two 4bit adders
	
	assign next_b = (sel == 1) ? (~b + 1) : b;;	//if sel is 1 -which means subtraction- negate the bits and add 1, 2's complement
							//else just use b as is
	
										//adding with negated value of b is the same as subtracting b; a - b = a + (-b). 
	cla_4bit lsbs (a[3:0], next_b[3:0], 1'b0, result[3:0], carry[0]);	//add least significant bits of a and determined value of b according to the sel bit
	cla_4bit msbs (a[7:4], next_b[7:4], carry[0], result[7:4], carry[1]);	//add most significant bits
endmodule
