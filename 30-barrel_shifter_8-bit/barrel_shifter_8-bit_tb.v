module barrl_tb;
  reg [7:0] a;
  wire [7:0] b;
  reg [2:0] sel;
  
  barrel_shift dut (a, b, sel);

//define input sequence
initial
begin
  #0 a=8'b01001100; sel = 3'b000;
  #10 a=8'b01001100; sel = 3'b001;
  #10 a=8'b01001100; sel = 3'b010;
  #10 a=8'b01001100; sel = 3'b011;
  #10 a=8'b01001100; sel = 3'b101;
  #10 a=8'b01001100; sel = 3'b110;
  #10 a=8'b01001100; sel = 3'b000;
  #10 a=8'b01001100; sel = 3'b111;


end
initial
begin
//display variables
  $dumpfile("dump.vcd"); $dumpvars;
  $monitor("go=%b | get=%b | sel=%b |", a, b, sel);
#120 $finish;
end 
  
endmodule
