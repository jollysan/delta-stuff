module moore_1010_detect(in, out, clk);

	input in, clk;
	output reg out;
	
	reg [2:0] state = 3'b000;	//state of the moore machine
	
	wire d0, d1, d2;			//wires to route data to update the state at the posedge
	
	
	//these operations are the result of the moore machine for 1010, i will upload the graph to my github
	assign d2 = !in && state[1] && !state[0];
	assign d1 = in;
	assign d0 = (in && state[2] && !state[1] && !state[0]) || (!in && !state[2] && state[1] && state[0]);
	assign wout = !state[1] && state[0];
	
	//update the state of the machine
	always @ (posedge clk) begin
		
		state[2] = d2;
		state[1] = d1;
		state[0] = d0;
		out = wout;		//result of the previous state to output
		
		
	end
	
	
	
endmodule
