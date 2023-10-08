
module bcd_time_count(clk, rst, ms_hr, ls_hr, ms_min, ls_min, ms_sec, ls_sec);
	
	input clk, rst;
    output reg [3:0] ms_hr = 0, ls_hr = 9, ms_min = 5, ls_min = 8, ms_sec = 5, ls_sec = 5;
  
  
  
	always @ (posedge clk) begin
		
		if(ls_sec == 9) begin //if time is xx:xx:x9, make the lst second 0 and increment other digit
			ls_sec = 0;
			
			if(ms_sec == 5) begin	//if second is 59, increment 1 minute
				ms_sec = 0;
				
				if(ls_min == 9) begin	//if minute is x9, increment other digit
					ls_min = 0;
					
					if(ms_min == 5) begin	//if minute is 59, icrement 1 hour
						ms_min = 0;
						
						if(ms_hr == 2) begin		//if hour is 2x, (in 20's), check if hour is 23:59:59
							if(ls_hr == 3) begin	//if it is, reset time to 00:00:00 (minute and seconds are already 0)
								ms_hr = 0;
								ls_hr = 0;
							end
							else					//if not 23.59:59, but like 21:59
								ls_hr = ls_hr + 1;	//increment 1 hour
						end
						else if (ls_hr == 9) begin	//if hour is 09:59:59 or 19:59, make ls_hr 0; andincrement a 10 
							ls_hr = 0;
							ms_hr = ms_hr + 1;
						end
						else						//if not hour x9, just increment it
							ls_hr = ls_hr + 1;
						
					end
					else							//if not minute 5x, increment a 10 minute
						ms_min = ms_min + 1;
				
				
				end
				else								//if not minute x9, increment a minute
					ls_min = ls_min + 1;
				
				
			end
			else									//if not second 5x, increment a 10
				ms_sec = ms_sec + 1;
			
			
		end
		else										//if not second x9, increment a second
			ls_sec = ls_sec + 1;
		
	end
	
	
	
endmodule
