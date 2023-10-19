

//reset does not work, please do not reset
//reset does something but not anything helpful

//can use reset to start it initially
//when reset is 1, it does not count

//but after the initial start, reset is unstable

module asynch_down_counter(reset, clk, q);
	
	input clk, reset;
	
	output [3:0] q;
	
	wire [3:0] nq;
	
	
	jkff ff1(!reset, 1'b1, clk, q[0], nq[0]);
	jkff ff2(!reset, 1'b1, nq[0], q[1], nq[1]);
	jkff ff3(!reset, 1'b1, nq[1], q[2], nq[2]);
	jkff ff4(!reset, 1'b1, nq[2], q[3], nq[3]);
	
	
	
	
endmodule



module jkff(j, k, clk, q, nq);
	
	input j, k, clk;
	output reg q = 1;
	output reg nq = 0;
	
	
	always @ (posedge clk) begin
		
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
