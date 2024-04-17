`timescale 1ns/1ns
module dct1d #(parameter n=8)( 
        input clk,			                                  	   //	input clock
		input reset,		  	                                   //	reset
		input wr,		                                           //	writing data to memory
		input oe,		                                           //	displaying the final output
		input [n-1:0]data_in,	                                           //	n-bit data input
		input [2:0]add,		                                           //	3-bit address for data input
		output reg [n-1:0]data_out                                           //	n-bit data output
	);

	reg [7:0]x[n-1:0];	

	/*WRITING DATA TO MEMORY***********************/
	always @( posedge clk) 
	begin
	if(reset)
	x[add]=0;
	else if(wr)
	x[add]= data_in;
	end

	wire [n-1:0] cout;


	//first stage
	wire signed [2*n:0] x01,x11,x21,x31,x41,x51,x61,x71;		            //	 wire for 1-stage butterfly

	HybridAdder #(.N1(n),.N2(n),.addOrSub(0)) HybridAdderInst1(
		.A(x[0]),
		.B(x[7]),
		.sum(x01),
		.cout(cout[0])
	);

	HybridAdder #(.N1(n),.N2(n),.addOrSub(1)) HybridAdderInst2(
		.A(x[0]),
		.B(x[7]),
		.sum(x11),
		.cout(cout[1])
	);


	HybridAdder #(.N1(n),.N2(n),.addOrSub(0)) HybridAdderInst3(
		.A(x[4]),
		.B(x[1]),
		.sum(x21),
		.cout(cout[2])
	);


	HybridAdder #(.N1(n),.N2(n),.addOrSub(1)) HybridAdderInst4(
		.A(x[4]),
		.B(x[1]),
		.sum(x31),
		.cout(cout[3])
	);


	HybridAdder #(.N1(n),.N2(n),.addOrSub(0)) HybridAdderInst5(
		.A(x[6]),
		.B(x[2]),
		.sum(x41),
		.cout(cout[4])
	);

	HybridAdder #(.N1(n),.N2(n),.addOrSub(1)) HybridAdderInst6(
		.A(x[6]),
		.B(x[2]),
		.sum(x51),
		.cout(cout[5])
	);

	HybridAdder #(.N1(n),.N2(n),.addOrSub(0)) HybridAdderInst7(
		.A(x[5]),
		.B(x[3]),
		.sum(x61),
		.cout(cout[6])
	);


	HybridAdder #(.N1(n),.N2(n),.addOrSub(1)) HybridAdderInst8(
		.A(x[5]),
		.B(x[3]),
		.sum(x71),
		.cout(cout[7])
	);
    
endmodule
