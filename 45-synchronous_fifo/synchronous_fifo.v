parameter WIDTH = 8;	//size of one element
parameter LEN = 4;	//element count, can store 4 different data
//do not change parameter sizes


module sync_fifo(data_in, reset, wr, rd, clk, full, empty, data_out);
	
	input reset, wr, rd, clk;
	input [WIDTH-1:0] data_in;
	
	output reg [WIDTH-1:0] data_out;
	output full, empty;
	
	reg [WIDTH-1:0] fifo_reg [LEN-1:0]; //len pieces of space to store information
	reg [2:0] reads, writes;	//where is current data
	
	
	
	assign full = (writes == LEN);		//full when write pointer exceeds register count
	assign empty = (writes == reads);	//empty when last written data is read
	
	
	always @ (posedge clk, posedge reset) begin
		
		if(reset) begin
			reads = 0;
			writes = 0;
			fifo_reg[0] = 0;
			data_out = 0;
		end
		else begin
			
			if(wr && !full) begin
				fifo_reg[writes] = data_in;
				writes = writes + 1;
			end
			if(rd && !empty) begin
				data_out = fifo_reg[reads];
				reads = reads + 1;
			end
			
			
			
		end
		
		
		
	end
	
	
	
	
	
endmodule
