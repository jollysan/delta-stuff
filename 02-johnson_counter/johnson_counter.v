`timescale 1ns/1ps

module johnson_counter(clk,reset,count);

	parameter WIDTH=4; //ringin kaç bitlik olacağını belirtiyor
	
	input clk,reset;
	
	output reg [WIDTH-1:0] count;
	
	
	always@(posedge clk)
	begin
		if(reset) begin
			//generate artık kullanılmıyor?, edaplaygroundda anlayamadım
			//generate
				for(int i = WIDTH-1; i >= 0; i = i - 1) begin	//kaç bit istiyorsak o kadar kaydırma
				
					count[i] <= (i==WIDTH-1)? ~count[0] : count[i+1];	//ring counterdan farkı msbyi lsbnin not şeklinde alıyoruz	
					
					
				end
			//endgenerate
			
		end
		
		else 
			count=1;
	end
endmodule
