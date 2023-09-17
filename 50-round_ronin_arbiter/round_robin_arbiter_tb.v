`timescale 1ns/1ps


module round_robin_arbiter_tb;
	reg [2:0] go;
	wire [2:0] get;
  
	reg clk = 0;
  
  round_arbit dut(go, get, clk);

//define input sequence
initial
begin
  
	#0  go[0] = 0; go[1] = 0; go[2] = 0;
	#10 go[0] = 1; go[1] = 0; go[2] = 0;
	#10 go[0] = 0; go[1] = 1; go[2] = 0;
	#10 go[0] = 0; go[1] = 0; go[2] = 1;
	#10 go[0] = 1; go[1] = 0; go[2] = 1;
	#10 go[0] = 0; go[1] = 1; go[2] = 1;
	#10 go[0] = 1; go[1] = 0; go[2] = 1;
	#10 go[0] = 1; go[1] = 1; go[2] = 0;
  


end
initial
begin
//display variables
  $dumpfile("dump.vcd"); $dumpvars;
  $monitor("go=%b | go=%b | go=%b | get=%b | get=%b | get=%b |", go[0], go[1], go[2], get[0], get[1], get[2]);
#100 $finish;
end 
  
  always
	#10 clk=~clk;
  
endmodule
