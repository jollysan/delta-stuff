`timescale 1ns/1ps


module fixed_priority_arbiter_tb;
	reg go1, go2, go3;
	wire get1, get2, get3;
  
	reg clk = 0;
  
  fix_arbit dut(go1, go2, go3, get1, get2, get3, clk);

//define input sequence
initial
begin
  
	#0 go1 = 0; go2 = 0; go3 = 0;
	#10 go1 = 1; go2 = 0; go3 = 0;
	#10 go1 = 0; go2 = 1; go3 = 0;
	#7 go1 = 0; go2 = 0; go3 = 1;
	#13 go1 = 1; go2 = 0; go3 = 1;
	#10 go1 = 0; go2 = 1; go3 = 1;
	#10 go1 = 1; go2 = 0; go3 = 1;
	#10 go1 = 1; go2 = 1; go3 = 0;
  


end
initial
begin
//display variables
  $dumpfile("dump.vcd"); $dumpvars;
  $monitor("go=%b | go=%b | go=%b | get=%b | get=%b | get=%b |", go1, go2, go3, get1, get2, get3);
#100 $finish;
end 
  
  always
	#10 clk=~clk;
  
endmodule
