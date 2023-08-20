module one_hot(num,one_hot);
	input   [3:0]     num;
	output  reg [15:0] one_hot;
	
	//for içinde teker teker kaydırmayı düşünmüştüm ama githubda hazır kod daha mantıklıymış bunu yapıştırdım
	
	//16b'0000000000000001 sayısını inputumuz kadar kaydırıyoruz
	assign one_hot = 1'b1<<num;

endmodule
