`timescale 1ns/1ps


module moremore_tb;
  reg [3:0] go_data = 0;
  reg clk = 1;
  reg [2:0] op = 0;
  
  wire [3:0] get_data;

  
  shifts dut (go_data, clk, op, get_data);

//define input sequence
initial
begin
  #10 go_data = 4'b1101; op = 3'b010;
  #10 go_data = 4'b1101; op = 3'b011;
  #10 go_data = 4'b1101; op = 3'b111;
  #10 go_data = 4'b1101; op = 3'b110;
  #10 go_data = 4'b1101; op = 3'b101;

end
initial
begin
//display variables
  $dumpfile("dump.vcd"); $dumpvars;
  $monitor("go: %b | get: %b | op: %b |", go_data, get_data, op);
#70 $finish;
end 
  
  always
    #5 clk = ~clk;
  
endmodule
