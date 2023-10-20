`timescale 1ns/1ps


module moremore_tb;
  reg clk = 0;
  
  wire div_clk;

  
  freq_div dut (clk, div_clk);
  

initial
begin
//display variables
  $dumpfile("dump.vcd"); $dumpvars;

#100 $finish;
end 
  
  always
    #5 clk = ~clk;
  
endmodule
