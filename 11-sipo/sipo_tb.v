`timescale 1ns/1ps

parameter WIDE=4;

module shift_tb;
  reg reset = 0;
  reg go, clk = 0;
  wire [WIDE-1:0] get;

  sipo dut(go, reset, clk, get);

//define input sequence
initial
begin
  
  #0 reset = 1;
  #10 go = 1;
  #10 reset = 0;
  #00 go = 1;
  #10 go = 1;
  #10 go = 0;
  #10 go = 1;
  #10 go = 0;
  #10 go = 1;
  #10 go = 0;
  #10 go = 0;
  #10 go = 0;
  


end
initial
begin
//display variables
  $dumpfile("dump.vcd"); $dumpvars;
  $monitor("go=%b | get=%b | reset=%b | g=%b |", go, get, reset);
#120 $finish;
end 
  
  always
	#5 clk=~clk;
  
endmodule
