//copied my code from ring counter (changed width parameter according to my needs)
//loops the bits as if its a ring(for round robin priority)
module ring_counter(clk,reset,count);

	parameter WIDTH=3; //ringin kaç bitlik olacağını belirtiyor
	
	input clk,reset;
	
	output reg [WIDTH-1:0] count = 3'b001;
	
	
	always@(posedge clk or negedge clk)
	begin
		if(reset) begin
			
				for(integer i = WIDTH-1; i >= 0; i = i - 1) begin	//bitimizi oynatmayı ringing büyüklüğü sayısınca yapıyoruz
				
					count[i] <= (i==WIDTH-1)? count[0] : count[i+1];	//bitimizi lsb ye doğru kaydırıyoruz, msb ise lsb değerini alıyor
												//johnsondan farkı count[0] kısmını düz aldık, not değil
					
				end
			
			
		end
		
		else 
			count=1;
	end
endmodule


//priority loops from lsb to msb
//for every loop, priority lessens to most prior to msb
//if msb has priority(in[2]), lsb has the second priority(in[0])
//in the next cycle, in[1] has priority and msb(in[2]) has second priority, lsb(in[0]) has least priority
module round_arbit(in, out, clk);
	
	input clk;
	input [2:0]in;
	output reg [2:0] out;
	
	reg [2:0] prior;	//for granting lesser priority outpts a chance
	reg [2:0] ring;		//to get a new priority for every clock cycle
	
	ring_counter gen_priority(clk, 1'b1, ring);	//get a new priority for every cycle
	
	always @(*) begin
		prior = ring;
		for(integer i = 0; i < 2; i = i + 1) begin
		
			if(in[2] && prior[2])
				out <= 3'b100;
			else if(in[1] && prior[1])
				out <= 3'b010;
			else if(in[0] && prior[0])
				out <= 3'b001;
			else if(in == 3'b000)
				out <= 3'b000;
			else begin		//if no active input has most priority, change priority to second most, then third
				if(prior[2])
					prior = 3'b001;		//msb to lsb, like reversed ring counter
				else
					prior = prior<<1;	//next most prior in the current cycle
			end
		end
	end
	
endmodule
