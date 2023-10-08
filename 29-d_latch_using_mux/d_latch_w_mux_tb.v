`timescale 1ns/1ps


module moremore_tb;
  reg clk = 0;
  reg d = 0;
  
  wire get;

  
  dff_wmux dut (d,clk,get);

//define input sequence
initial
begin
  #0 d = 0;

end
initial
begin
//display variables
  $dumpfile("dump.vcd"); $dumpvars;
  $monitor("time: d=%b | get=%b |", d, get);
#200 $finish;
end 
  
  always
    #10 d = !d;
  
  always
	#5 clk=~clk;
  
endmodule
