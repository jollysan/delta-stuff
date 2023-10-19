module edge_detect(data, clk, isedge);
	
	input data, clk;
	output reg isedge;
	
	reg prev = 0;
	
	always @ (posedge clk) begin
		
		isedge = data && !prev;
		prev = data;
		
	end
	
	
	
endmodule
