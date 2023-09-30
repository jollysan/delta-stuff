`timescale 1ns/1ps


module moremore_tb;
  reg clk = 0;
  reg go;
  wire get;

  
  moore_1010_detect dut (go, get, clk);

//define input sequence
initial
begin
  #0 go = 0;
  #10 go = 0;
  #10 go = 1;
  #10 go = 0;
  #10 go = 1;
  #10 go = 1;
  #10 go = 0;
  #10 go = 1;
  #10 go = 0;
  #10 go = 1;
  #10 go = 1;
  #10 go = 0;


end
initial
begin
//display variables
  $dumpfile("dump.vcd"); $dumpvars;
  $monitor("go=%b | get=%b |", go, get);
#200 $finish;
end 
  
  always
	#5 clk=~clk;
  
endmodule
