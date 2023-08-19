`timescale 1ns/1ps;

module clockdivider(clk,count,rst);
	input clk,rst;
	
	output reg [3:0] count; //ayrı ayrı vermek yerine bus olarak çıkuş, msb 16, lsb 2 ye bölünmüş hali clockun
	always@(posedge clk)
	begin
		if(rst==0)	//reset 0 ise sayacı sıfırla (aynı zamanda output  da 4b'0000 oluyor)
			count=4'b0000;
			
		else
			//4-bitlik sayaç olduğu için her posedgede bir ile topluyoruz
			//istenilen divisionlar 2nin kuvveti olduğu için böyle yapabiliyoruz, 3 veya 7ye bölüm isteseydi yapamazdık
			//mesela count[2] her 4 periyotta bir değişiyor yani clocku 8e bölmüş oluyor.
			count=count+1;	
	end
endmodule
