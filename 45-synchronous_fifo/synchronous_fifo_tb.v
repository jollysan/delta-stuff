`timescale 1ns/1ps


module moremore_tb;
  reg clk = 0;
  
  reg [7:0] go_data;
  reg write, read, reset; 
  
  
  wire full, empty;
  wire [7:0] get_data;

  
  sync_fifo dut (go_data ,reset, write, read, clk, full, empty, get_data);
  
  

//define input sequence
initial
begin
  #0 go_data = 7'b1000000; write = 1; read = 0; reset = 1;
  #10 go_data = 7'b0100000; write = 1; read = 0; reset = 0;
  #10 go_data = 7'b0000000; write = 1; read = 0;
  #10 go_data = 7'b0000110; write = 1; read = 0;
  #10 go_data = 7'b0011010; write = 1; read = 0;
  #10 go_data = 7'b0000001; write = 1; read = 0;
  #10 go_data = 7'b0000000; write = 1; read = 1;
  #10 go_data = 7'b0000000; write = 0; read = 1;
  #10 go_data = 7'b0000000; write = 0; read = 1;
  #10 go_data = 7'b0000000; write = 0; read = 1;
  #10 go_data = 7'b0000000; write = 0; read = 1;
  #10 go_data = 7'b0000000; write = 0; read = 1;

end
initial
begin
//display variables
  $dumpfile("dump.vcd"); $dumpvars;
  $monitor("go: %b | get: %b | full: %b | empty: %b |", go_data, get_data, full, empty);
#200 $finish;
end 
  
  always
    #5 clk = ~clk;
  
endmodule
