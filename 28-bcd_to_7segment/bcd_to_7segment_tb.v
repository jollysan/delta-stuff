`timescale 1ns/1ps


module moremore_tb;
  reg [3:0] bcd_go;
  
  wire [6:0] segments;

  
  bcd_7segment dut (bcd_go, segments);

//define input sequence
initial
begin
  #0 bcd_go=4'b0000;
  #10 bcd_go=4'b0001;
  #10 bcd_go=4'b0010;
  #10 bcd_go=4'b0011;
  #10 bcd_go=4'b0100;
  #10 bcd_go=4'b0101;
  #10 bcd_go=4'b0110;
  #10 bcd_go=4'b0111;
  #10 bcd_go=4'b1000;
  #10 bcd_go=4'b1001;

end
initial
begin
//display variables
  $dumpfile("dump.vcd"); $dumpvars;
  $monitor("bcd: %b | segs: %b |", bcd_go, segments);
#200 $finish;
end 
  
endmodule
