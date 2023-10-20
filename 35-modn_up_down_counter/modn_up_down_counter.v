
parameter N = 10;


module modn_updown(up ,clk, rst, count);
	
	input up, clk, rst;
	
	output reg [$clog2(N)-1:0] count;//how many regs to store mod number
	
	always @(posedge clk or posedge rst) begin
		
		if(rst) begin
			if(up)
				count = 0;		//reset to 0
			else
				count = N - 1;	//reset to mod
		end
		else begin	//if not reset
			if(up)	
				if(count == N-1)//if max
					count = 0;	//reset
				else
					count = count + 1;//count up
			else	//if down
				if(count == 0)
					count = N - 1;//reset to mod if 0
				else
					count = count - 1;//count down
		end
		
	end
endmodule
