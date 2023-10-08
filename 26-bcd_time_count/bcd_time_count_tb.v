`timescale 1ns/1ps


module moremore_tb;
  reg clk = 0, reset = 0;
  wire [3:0] ms_hr, ls_hr, ms_min, ls_min, ms_sec, ls_sec;

  
  bcd_time_count dut (clk, reset, ms_hr, ls_hr, ms_min, ls_min, ms_sec, ls_sec);

//define input sequence
initial
begin
  #0 reset = 0;

end
initial
begin
//display variables
  $dumpfile("dump.vcd"); $dumpvars;
  $monitor("time: %b%b.%b%b.%b%b|", ms_hr, ls_hr, ms_min, ls_min, ms_sec, ls_sec);
#200 $finish;
end 
  
  always
	#1 clk=~clk;
  
endmodule
