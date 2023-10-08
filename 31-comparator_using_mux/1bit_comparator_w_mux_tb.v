`timescale 1ns/1ps


module moremore_tb;
  reg go1, go2;
  
  wire greater, lesser, equal;

  
  comp_w_mux dut (go1, go2, equal, greater, lesser);

//define input sequence
initial
begin
  #0 go1 = 0; go2 = 0;
  #10 go1 = 1; go2 = 0;
  #10 go1 = 0; go2 = 1;
  #10 go1 = 1; go2 = 1;
  #10 go1 = 0; go2 = 0;
  #10 go1 = 0; go2 = 1;

end
initial
begin
//display variables
  $dumpfile("dump.vcd"); $dumpvars;
  $monitor("go1=%b | go2=%b --- gr=%b | le=%b | eq=%b |", go1, go2, greater, lesser, equal);
#100 $finish;
end 
  
  
endmodule
