module buf(in, out);
	input in;
	output out;
	
	wire nin;
	
	not n1(nin, in);
	not n2(out, nin);

endmodule
