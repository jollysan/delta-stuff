`timescale 1ns/1ps


module moremore_tb;
  reg reset = 0;
  reg clk = 1;
  
  wire [3:0] count;

  
  asynch_down_counter dut (reset, clk, count);

//define input sequence
initial
begin
  #0 reset = 1;
  #20 reset = 0;
  #10 reset = 0;

end
initial
begin
//display variables
  $dumpfile("dump.vcd"); $dumpvars;
  $monitor("rst: %b | count: %b |", reset, count);
#200 $finish;
end 
  
  always
    #5 clk = ~clk;
  
endmodule
