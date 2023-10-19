`timescale 1ns/1ps


module moremore_tb;
  reg c, n;
  reg clk = 0;
  
  wire result;

  
  cnff dut (c, n, clk, result);

//define input sequence
initial
begin
  #0 c = 0; n = 0;
  #10 c = 0; n = 0;
  #10 c = 0; n = 1;
  #10 c = 1; n = 1;
  #10 c = 0; n = 1;
  #10 c = 1; n = 1;
  #10 c = 1; n = 1;
  #10 c = 1; n = 1;
  #10 c = 1; n = 0;
  #10 c = 1; n = 0;
  #10 c = 0; n = 1;
  
  
  
end
initial
begin
//display variables
  $dumpfile("dump.vcd"); $dumpvars;
  
#200 $finish;
end 
  
  always
    #5 clk = ~clk;
  
endmodule
