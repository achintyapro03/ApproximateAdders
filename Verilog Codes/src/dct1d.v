module dct1d #(parameter N=16)( 
		input [N * 8 - 1:0] data_in,                              	   //	N-bit data input
		output [N * 8 - 1:0] data_out                         //	N-bit data output
	);

	// reg [(8 * N) - 1:0] x = data_in;

	/*WRITING DATA TO MEMORY***********************/
	// always @( posedge clk) 
	// begin
	// if(reset)
	// x[add]=0;
	// else if(wr)
	// x[add]= data_in;
	// end

	// always @( posedge clk) 
	// begin
	// end


	wire [7:0] cout_1;
	wire [11:0] cout_2;
	wire [7:0] cout_3;

	real c0 = 0.35369;
	real c1 = 0.49040;
	real c2 = 0.46198;
	real c3 = 0.41582;
	real c4 = 0.35369;
	real c5 = 0.27799;
	real c6 = 0.19162;
	real c7 = 0.09789;

	wire signed [N - 1:0] x0_1,x1_1,x2_1,x3_1,x4_1,x5_1,x6_1,x7_1;		            //	 wire for 1-stage butterfly
	wire signed [N - 1:0] x0_2,x1_2,x2_2,x3_2,x4_2,x5_2,x6_2,x7_2,x8_2,x9_2,x10_2,x11_2;		            //	 wire for 1-stage butterfly
	wire signed [N - 1:0] X0,X1,X2,X3,X4,X5,X6,X7,tempX0,tempX4;

	assign X0 = tempX0 * c4;
	assign X4 = tempX4 * c4;

	// always @* begin
	assign data_out = {X0, X1, X2, X3, X4, X5, X6, X7};
    // end


	integer i;

 	reg signed [N-1:0] split_array [7:0];
	always @* begin
		for (i = 0; i < 8; i = i + 1) begin
			split_array[7 - i] = data_in[i*N +: N];
		end
	end

	//first stage
	// ################################################################################################################################################################

	HybridAdder #(.N1(N-4),.N2(4),.addOrSub(0)) HybridAdderLayer1_1(
		.A(split_array[0]),
		.B(split_array[7]),
		.sum(x0_1),
		.cout(cout_1[0])
	);

	HybridAdder #(.N1(N-4),.N2(4),.addOrSub(1)) HybridAdderLayer1_2(
		.A(split_array[0]),
		.B(split_array[7]),
		.sum(x1_1),
		.cout(cout_1[1])
	);


	HybridAdder #(.N1(N-4),.N2(4),.addOrSub(0)) HybridAdderLayer1_3(
		.A(split_array[4]),
		.B(split_array[1]),
		.sum(x2_1),
		.cout(cout_1[2])
	);


	HybridAdder #(.N1(N-4),.N2(4),.addOrSub(1)) HybridAdderLayer1_4(
		.A(split_array[4]),
		.B(split_array[1]),
		.sum(x3_1),
		.cout(cout_1[3])
	);


	HybridAdder #(.N1(N-4),.N2(4),.addOrSub(0)) HybridAdderLayer1_5(
		.A(split_array[6]),
		.B(split_array[2]),
		.sum(x4_1),
		.cout(cout_1[4])
	);

	HybridAdder #(.N1(N-4),.N2(4),.addOrSub(1)) HybridAdderLayer1_6(
		.A(split_array[6]),
		.B(split_array[2]),
		.sum(x5_1),
		.cout(cout_1[5])
	);

	HybridAdder #(.N1(N-4),.N2(4),.addOrSub(0)) HybridAdderLayer1_7(
		.A(split_array[5]),
		.B(split_array[3]),
		.sum(x6_1),
		.cout(cout_1[6])
	);


	HybridAdder #(.N1(N-4),.N2(4),.addOrSub(1)) HybridAdderLayer1_8(
		.A(split_array[5]),
		.B(split_array[3]),
		.sum(x7_1),
		.cout(cout_1[7])
	);
    // #######################################################################################################################################################################

	// 2nd stage
	// #######################################################################################################################################################################

	HybridAdder #(.N1(N-4),.N2(4),.addOrSub(0)) HybridAdderLayer2_1(
		.A(x1_1 * c1),
		.B(x3_1 * c7),
		.sum(x0_2),
		.cout(cout_2[0])
	);

	HybridAdder #(.N1(N-4),.N2(4),.addOrSub(1)) HybridAdderLayer2_2(
		.A(x1_1 * c7),
		.B(x3_1 * c1),
		.sum(x1_2),
		.cout(cout_2[1])
	);

	HybridAdder #(.N1(N-4),.N2(4),.addOrSub(0)) HybridAdderLayer2_3(
		.A(x5_1 * c3),
		.B(x7_1 * c5),
		.sum(x2_2),
		.cout(cout_3[2])
	);

	HybridAdder #(.N1(N-4),.N2(4),.addOrSub(1)) HybridAdderLayer2_4(
		.A(x5_1 * c5),
		.B(x7_1 * c3),
		.sum(x3_2),
		.cout(cout_3[3])
	);

	HybridAdder #(.N1(N-4),.N2(4),.addOrSub(0)) HybridAdderLayer2_5(
		.A(x1_1 * c5),
		.B(x3_1 * c3),
		.sum(x4_2),
		.cout(cout_2[4])
	);

	HybridAdder #(.N1(N-4),.N2(4),.addOrSub(1)) HybridAdderLayer2_6(
		.A(x1_1 * c3),
		.B(x3_1 * c5),
		.sum(x5_2),
		.cout(cout_2[5])
	);

	HybridAdder #(.N1(N-4),.N2(4),.addOrSub(0)) HybridAdderLayer2_7(
		.A(x5_1 * c7),
		.B(x7_1 * c1),
		.sum(x6_2),
		.cout(cout_2[6])
	);
	
	HybridAdder #(.N1(N-4),.N2(4),.addOrSub(1)) HybridAdderLayer2_8(
		.A(x5_1 * c1),
		.B(x7_1 * c7),
		.sum(x7_2),
		.cout(cout_2[7])
	);

	HybridAdder #(.N1(N-4),.N2(4),.addOrSub(0)) HybridAdderLayer2_9(
		.A(x0_1),
		.B(x2_1),
		.sum(x8_2),
		.cout(cout_2[8])
	);

	HybridAdder #(.N1(N-4),.N2(4),.addOrSub(1)) HybridAdderLayer2_10(
		.A(x0_1),
		.B(x2_1),
		.sum(x9_2),
		.cout(cout_2[9])
	);

	HybridAdder #(.N1(N-4),.N2(4),.addOrSub(0)) HybridAdderLayer2_11(
		.A(x4_1),
		.B(x6_1),
		.sum(x10_2),
		.cout(cout_2[10])
	);

	HybridAdder #(.N1(N-4),.N2(4),.addOrSub(1)) HybridAdderLayer2_12(
		.A(x4_1),
		.B(x6_1),
		.sum(x11_2),
		.cout(cout_2[11])
	);
	// #######################################################################################################################################################################

	// 3rd Layer

	HybridAdder #(.N1(N-4),.N2(4),.addOrSub(0)) HybridAdderLayer3_1(
		.A(x0_2),
		.B(x2_2),
		.sum(X1),
		.cout(cout_3[1])
	);

	HybridAdder #(.N1(N-4),.N2(4),.addOrSub(1)) HybridAdderLayer3_2(
		.A(x1_2),
		.B(x3_2),
		.sum(X7),
		.cout(cout_3[7])
	);


	HybridAdder #(.N1(N-4),.N2(4),.addOrSub(1)) HybridAdderLayer3_3(
		.A(x4_2),
		.B(x7_2),
		.sum(X5),
		.cout(cout_3[5])
	);


	HybridAdder #(.N1(N-4),.N2(4),.addOrSub(1)) HybridAdderLayer3_4(
		.A(x5_2),
		.B(x6_2),
		.sum(X3),
		.cout(cout_3[3])
	);


	HybridAdder #(.N1(N-4),.N2(4),.addOrSub(0)) HybridAdderLayer3_5(
		.A(x9_2 * c2),
		.B(x11_2 * c6),
		.sum(X2),
		.cout(cout_3[2])
	);

	HybridAdder #(.N1(N-4),.N2(4),.addOrSub(1)) HybridAdderLayer3_6(
		.A(x9_2 * c6),
		.B(x11_2 * c2),
		.sum(X6),
		.cout(cout_3[6])
	);

	HybridAdder #(.N1(N-4),.N2(4),.addOrSub(0)) HybridAdderLayer3_7(
		.A(x8_2),
		.B(x10_2),
		.sum(tempX0),
		.cout(cout_3[0])
	);


	HybridAdder #(.N1(N-4),.N2(4),.addOrSub(1)) HybridAdderLayer3_8(
		.A(x8_2),
		.B(x10_2),
		.sum(tempX4),
		.cout(cout_3[4])
	);

	// ###################################################################################################
endmodule
