`timescale 1ns/1ps


module moremore_tb;
  reg reset = 0;
  reg clk = 0;
  reg upp = 1;
  
  wire [3:0] count;

  
  modn_updown dut (upp, clk, reset, count);

//define input sequence
initial
begin
  #0 reset = 0;
  #20 reset = 1;
  #10 reset = 0;
  #10 upp = 1;
  #10 upp = 1;
  #10 upp = 0; reset = 1;
  #10 upp = 0; reset = 0;
  #10 upp = 0;
  #10 upp = 0;
  #10 upp = 0;
  #10 upp = 0;

end
initial
begin
//display variables
  $dumpfile("dump.vcd"); $dumpvars;
  $monitor("up: %b | count: %b |", upp, count);
#200 $finish;
end 
  
  always
    #5 clk = ~clk;
  
endmodule
