`timescale 1ns/1ps



module moremore_tb;
  reg go;
  reg clk = 0;
  
  wire edgy;

  
  edge_detect dut (go, clk, edgy);

//define input sequence
initial
begin
  #0 go = 0;
  #10 go = 0;
  #10 go = 0;
  #10 go = 1;
  #10 go = 1;
  #10 go = 1;
  #10 go = 0;
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
  $monitor("go: %b | edge: %b |", go, edgy);
#200 $finish;
end 
  
  always
    #5 clk = ~clk;
  
endmodule
