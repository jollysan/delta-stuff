`timescale 1ns/1ps

parameter WIDE=4;

module shift_tb;
  reg reset = 0;
  reg sh = 0;
  reg [WIDE-1:0] go;
  reg clk = 0;
  wire get;

       piso dut(go, reset, sh, clk, get);

//define input sequence
initial
begin
  
  #0 reset = 0;
  #10 go = 4'b1101;
  #10 go = 4'b1101; sh = 1;
  #10 go = 4'b1101;
  #10 go = 4'b0100;
  #10 go = 4'b1001;
  #10 go = 4'b1010; sh = 0;
  #10 go = 4'b1001; sh = 1;
  #10 go = 4'b0000;
  #10 go = 4'b0000;
  #10 go = 4'b0000;
  


end
initial
begin
//display variables
  $dumpfile("dump.vcd"); $dumpvars;
  $monitor("go=%b | get=%b | sh=%b | g=%b |", go, get, sh);
#120 $finish;
end 
  
  always
	#5 clk=~clk;
  
endmodule
