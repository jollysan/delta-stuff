`timescale 1ns / 1ps


module multiplier_4bit_tb();
reg [3:0] a,b;
wire [7:0] product;

// Instantiate the design module
mult_4bit dut(a,b,product);

initial
begin
	#0  a = 4'b0110; b = 4'b0110;
	#10 a = 4'b0010; b = 4'b0110;
	#10 a = 4'b0111; b = 4'b0101;
	#10 a = 4'b0111; b = 4'b0111;
	#10 a = 4'b0101; b = 4'b0101;
	#10 a = 4'b0111; b = 4'b0011;
	#10 a = 4'b0100; b = 4'b0110;
    #10 a = 4'b1011; b = 4'b1101;
    #10 a = 4'b0101; b = 4'b0011;
	#10 a = 4'b1111; b = 4'b0001;
	#10 a = 4'b0110; b = 4'b0100;
	#10 a = 4'b1111; b = 4'b1111;
end

//display variables
initial
begin
$monitor ("A = %b, B = %b, Product = %b", a, b, product);
#200 $finish;
end 

endmodule
