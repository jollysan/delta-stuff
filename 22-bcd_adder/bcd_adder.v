module bcd_adder(in1, in2, sum, carry);

	input [3:0] in1, in2;
	output reg [3:0] sum;
	output reg carry;
	
	reg [4:0] mid;	//to store binary sum and owerflow
	reg car;	//store carry bit if generated
	
	always@(in1, in2) begin
		car = 0;		//initiate carry bit
		mid = in1 + in2;	//calculate binary sum
		
		if(mid[4] == 1)	begin	//if the sum owerflows into a 5th bit
			mid = mid - 10;	//subtract 10 to make it decimal again
			car = 1;	//carry out for subtracted 10
		end
		if(mid>4'b1001)	begin	//if the sum is no longer decimal
			mid = mid - 10;	//subtract 10 to make it decimal again
			car = 1;	//carry out for subtracted 10
		end
		sum = mid[3:0];		//output the calculated decimal value
		carry = car;		//output the carry
	end
	
endmodule
