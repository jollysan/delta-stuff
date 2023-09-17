parameter WIDTH = 4; //bit width (n)

//n-bit data, 2x1 mux
module mux2(in, sel, out);
	
	
	input sel;		//selection
	input [WIDTH-1:0] in[1:0];	//inputs, 2- 8bit inputs
	output [WIDTH-1:0] out;	//8bit output
	wire [WIDTH-1:0] w1, w2;	//to connect gates
	wire nc_sel;		//negative of selection
	
	

	not(nc_sel, sel);
  
	generate
		//generate mux for every bit (WIDTH bits here -8 bits when i wrote this-)
		for(genvar i = 0; i < WIDTH; i = i + 1) begin
			and(w1[i], sel, in[1][i]);
			and(w2[i], nc_sel, in[0][i]);
			or(out[i], w1[i], w2[i]);
		end
	endgenerate
	
	//this assign command does the same thing as the generate block above,
	//but i like the gates more
	//assign out = (sel) ? in[1] : in[0];
endmodule

//4:1 n-bit mux
module mux4(in, sel, out);
	
	
	input [WIDTH-1:0] in [3:0];
	input [1:0] sel;
	output [WIDTH-1:0] out;
	wire [WIDTH-1:0] w1, w2;
	
	mux2 m1 (in[3:2], sel[0], w1);	//mux smaller parts to mux the last 2 data
	mux2 m2 (in[1:0], sel[0], w2);	
	
	//mux last 2 data survived
	mux2 mc ({w1, w2}, sel[1], out);
	
endmodule

//16:1 n-bit mux
module mux16(in, sel, out);
	
	
	input [WIDTH-1:0] in [15:0];
	input [3:0] sel;
	output [WIDTH-1:0] out;
	wire [WIDTH-1:0] w1, w2, w3, w4;
	
	//mux smaller parts(select 4 from 16 possible data)
	mux4 m1 (in[15:12], sel[1:0], w1);
	mux4 m2 (in[11:8], sel[1:0], w2);
	mux4 m3 (in[7:4], sel[1:0], w3);
	mux4 m4 (in[3:0], sel[1:0], w4);	
	
	//mux last 4 data survived(select the one we want)
	mux4 mc4 ({w1, w2, w3, w4}, sel[3:2], out);
	
endmodule

//256:1 n-bit mux
module mux256(in, sel, out);
	
	input [WIDTH-1:0] in [256:0];
	input [7:0] sel;
	output [WIDTH-1:0] out;
	wire [WIDTH-1:0] wir [15:0];
	
	generate
		for(genvar i = 0; i < 16; i = i + 1) begin
			mux16 mx16 (in[(i + 1)*16 -1 : i*16], sel[3:0], wir[i]);
			//for every i; increase by 16, so every mux16 gets 16 inputs. 16*16=256
		end
	endgenerate
	
	mux16 mux16final (wir, sel[7:4], out);
	
	
endmodule


//64K:1 n-bit mux
module mux64K(in, sel, out);
	
	input [WIDTH-1:0] in [65536:0];
	input [15:0] sel;
	output [WIDTH-1:0] out;
	wire [WIDTH-1:0] wir [255:0];
	
	generate
		for(genvar i = 0; i < 256; i = i + 1) begin
			mux256 mx256 (in[(i + 1)*256 -1 : i*256], sel[7:0], wir[i]);
			//for every i; increase by 256, so every mux256 gets 256 inputs. 256*256=65536 ,64KiB
		end
	endgenerate
	
	mux256 mux256final (wir, sel[15:8], out);
	
endmodule
