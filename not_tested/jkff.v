


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


module ms_jkff(j, k, clk, q, nq);
	
	input j, k, clk;
	output reg q, nq;
	
	wire slave_j, slave_k;
	
	jkff master(j, k, clk, slave_j, slave_k);
	jkff slave(slave_j, slave_k, clk, q, nq);
	
endmodule
