`timescale 1ns/1ps


module priority_encoder_tb;
  reg [7:0] go = 7'b0000000;
  reg clk = 0;
  wire [2:0] get;
  prior dut(go, get);

//define input sequence
initial
begin
  
  #0 go = 7'b0000001;
  
  #10 go = 7'b0000001;
  #10 go = 7'b0010001;
  #10 go = 7'b0001001;
  #10 go = 7'b0000001;
  #10 go = 7'b1010001;
  #10 go = 7'b0000101;
  #10 go = 7'b0000001;
  #10 go = 7'b0010001;

  


end
initial
begin
//display variables
  $dumpfile("dump.vcd"); $dumpvars;
  $monitor("go=%b | get=%b |", go, get);
#100 $finish;
end 
  
  always
	#10 clk=~clk;
  
endmodule
