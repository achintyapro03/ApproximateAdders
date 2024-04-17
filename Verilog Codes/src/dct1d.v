`timescale 1ns/1ns
module dct1d #(parameter n=16)( 
        input clk,			                                   //	input clock
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


//first stage
wire signed [2*n:0] x01,x11,x21,x31,x41,x51,x61,x71;		            //	 wire for 1-stage butterfly

HybridAdder #(.N1(n),.N2(n)) HybridAdderInst(
	.A(x[0]),
	.B(x[7]),
	.addOrSub(0),
	.x01({cout,sum}),
)

HybridAdder #(.N1(n),.N2(n)) HybridAdderInst(
	.A(x[0]),
	.B(x[7]),
	.addOrSub(1),
	.x11({cout,sum}),
)


HybridAdder #(.N1(n),.N2(n)) HybridAdderInst(
	.A(x[4]),
	.B(x[1]),
	.addOrSub(0),
	.x21({cout,sum}),
)


HybridAdder #(.N1(n),.N2(n)) HybridAdderInst(
	.A(x[4]),
	.B(x[1]),
	.addOrSub(1),
	.x31({cout,sum}),
)


HybridAdder #(.N1(n),.N2(n)) HybridAdderInst(
	.A(x[6]),
	.B(x[2]),
	.addOrSub(0),
	.x41({cout,sum}),
)

HybridAdder #(.N1(n),.N2(n)) HybridAdderInst(
	.A(x[6]),
	.B(x[2]),
	.addOrSub(1),
	.x51({cout,sum}),
)

HybridAdder #(.N1(n),.N2(n)) HybridAdderInst(
	.A(x[5]),
	.B(x[3]),
	.addOrSub(0),
	.x61({cout,sum}),
)


HybridAdder #(.N1(n),.N2(n)) HybridAdderInst(
	.A(x[5]),
	.B(x[3]),
	.addOrSub(1),
	.x71({cout,sum}),
)


    
endmodule
