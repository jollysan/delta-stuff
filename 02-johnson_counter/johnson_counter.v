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
				for(int i = 0; i < WIDTH; i = i + 1) begin	//bitimizi oynatmayı ringing büyüklüğü sayısınca yapıyoruz
				
					count[i] <= (i==0)? count[WIDTH-1] : count[i-1];	//bitimizi msb ye doğru kaydırıyoruz, lsb ise msb değerini alıyor
					
					
				end
			//endgenerate
			
		end
		
		else 
			count=1;
	end
endmodule
