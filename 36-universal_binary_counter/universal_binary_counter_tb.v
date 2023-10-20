`timescale 1ns/1ps


module moremore_tb;
  reg clk = 0;
  
  reg [3:0] go_data;
  reg load, reset, enable, inc; 
  
  wire [3:0] get_data;

  
  ubc dut (go_data, clk, reset, load, enable, inc, get_data);
  
  

//define input sequence
initial
begin
  #0 go_data = 4'b1000; reset = 0; load = 0; inc = 1; enable = 1; 
  #10 go_data = 4'b0000;
  #10 go_data = 4'b0000; enable = 0;
  #10 go_data = 4'b0000; enable = 1;
  #10 go_data = 4'b0000;
  #10 go_data = 4'b0010; load = 1;
  #10 go_data = 4'b0000; load = 0;
  #10 go_data = 4'b0000; inc = 0;
  #10 go_data = 4'b0000;
  #10 go_data = 4'b0000;
  #10 go_data = 4'b0000; reset = 1;
  #10 go_data = 4'b0000; reset = 0;
  #10 go_data = 4'b0000; inc = 1;
  
  
end
initial
begin
//display variables
  $dumpfile("dump.vcd"); $dumpvars;
  $monitor("go: %b | get: %b | inc: %b | en: %b |", go_data, get_data, inc, enable);
#200 $finish;
end 
  
  always
    #5 clk = ~clk;
  
endmodule
