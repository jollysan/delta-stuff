module adder(a, b, cin, cout, sum);

	input a, b, cin;
	output cout, sum;
	wire t1, t2, t3;
	
	xor(t1, a, b);
	and(t2, a, b);
	
	xor(sum, t1, cin);
	
	and(t3, t1, cin);
	or (cout, t1, t3);
	
endmodule


module sadder(in1, in2, clk, sum);

	input in1, in2, clk;
	output reg sum;
	
	wire cout, wsum;
	reg carry;
	
	adder(in1, in2, carry, cout, wsum);
	
	always @(posedge clk) begin
		sum = wsum    //output the sum
		carry = cout;  //route previous carry out into new carry in
		
	end
	
endmodule
