`timescale 1ns/1ps


module moremore_tb;
  reg clk = 0;
  reg reset = 1;
  wire [3:0] get;

  
  bcd_counter dut (clk, reset, get);

//define input sequence
initial
begin
  #0 reset = 1;
  #10 reset = 0;


end
initial
begin
//display variables
  $dumpfile("dump.vcd"); $dumpvars;
  $monitor("get=%b | get=%b |", get, get);
#150 $finish;
end 
  
  always
	#5 clk=~clk;
  
endmodule
