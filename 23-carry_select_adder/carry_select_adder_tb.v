`timescale 1ns/1ps

parameter WIDE=4;

module csa_tb;
  reg [WIDE-1:0] a, b;
  reg carry_go = 0;
  
  wire [WIDE-1:0] sum;
  wire carry_get;
  
  carry_select_adder dut (a, b, sum, carry_go, carry_get);

//define input sequence
initial
begin
  #0 a=4'b0001; b = 4'b0001;
  #10 a=4'b0001; b = 4'b0001;
  #10 a=4'b0001; b = 4'b0001;
  #10 a=4'b0011; b = 4'b0001;
  #10 a=4'b1001; b = 4'b0011;
  #10 a=4'b0101; b = 4'b0010;
  #10 a=4'b0001; b = 4'b0001;
  #10 a=4'b0001; b = 4'b0001;
  #10 a=4'b0001; b = 4'b0001;


end
initial
begin
//display variables
  $dumpfile("dump.vcd"); $dumpvars;
  $monitor("go=%b | get=%b | reset=%b | g=%b |", a, b, sum);
#120 $finish;
end 
  
  //always
	//#5 clk=~clk;
  
endmodule
