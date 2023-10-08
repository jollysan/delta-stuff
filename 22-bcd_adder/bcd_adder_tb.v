`timescale 1ns/1ps


module moremore_tb;
  reg [3:0] in1, in2;
  wire [3:0] get_sum;
  wire get_carry;
  
  reg clk = 0;
  
  bcd_adder dut (in1, in2, get_sum, get_carry);

//define input sequence
initial
begin
  #0 in1 = 4'b0000; in2 = 4'b0000;
  #10 in1 = 4'b0001; in2 = 4'b0001;
  #10 in1 = 4'b1000; in2 = 4'b0011; //8 + 3
  #10 in1 = 4'b0100; in2 = 4'b0100; //4 + 4
  #10 in1 = 4'b1001; in2 = 4'b1000; //9 + 8


end
initial
begin
//display variables
  $dumpfile("dump.vcd"); $dumpvars;
  $monitor("sum=%b | cout=%b |", get_sum, get_carry);
#100 $finish;
end 
  
  always
	#5 clk=~clk;
  
endmodule
