module dct2d #(parameter N = 16)( 
        input clk,			                                  	   //	input clock
		input [N * 8 * 8 - 1:0] data_in,	                                           //	N-bit data input		                                           //	3-bit address for data input
		output [N * 8 * 8 - 1:0] data_out                                              //	N-bit data output
	);

    wire [N * 8 * 8 - 1:0] stage1;
    wire [N * 8 * 8 - 1:0] stage2;
    wire [N * 8 * 8 - 1:0] stage3;


    // reg [N * 8 * 8 - 1:0] stage2;

    integer p;

 	reg [8*N-1:0] split_array1 [7:0];
	always @* begin
		for (p = 0; p < 8; p = p + 1) begin
            split_array1[p] = data_in[p*N*8 +: 8*N];
		end
	end

        genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin: dct1dloop1
            dct1d #(.N(N)) dct1dinst(
                .clk(clk),
                .data_in(split_array1[7 - i]),
                // .data_out(data_out[i * N * 8 +: N * 8])
                .data_out(data_out[(7 - i) * N * 8 +: N * 8])
            );
        end
    endgenerate
    // genvar i;
    // generate
    //     for (i = 0; i < 8; i = i + 1) begin: dct1dloop1
    //         dct1d #(.N(N)) dct1dinst(
    //             .clk(clk),
    //             .data_in(split_array1[7 - i]),
    //             // .data_out(data_out[i * N * 8 +: N * 8])
    //             .data_out(stage1[i * N * 8 +: N * 8])
    //         );
    //     end
    // endgenerate

    // transpose #(.N(8), .DATA_WIDTH(N)) transposeInst1(
    //     .matrix1d(stage1),
    //     .transposed_matrix1d(stage2)
    // );


 	// reg [8*N-1:0] split_array2 [7:0];
	// always @* begin
	// 	for (p = 0; p < 8; p = p + 1) begin
    //         split_array2[p] = stage2[p*N*8 +: 8*N];
	// 	end
	// end

    // genvar j;
    // generate
    //     for (j = 0; j < 8; j = j + 1) begin: dct1dloop2
    //         dct1d #(.N(N)) dct1dinst(
    //             .clk(clk),
    //             .data_in(split_array2[j]),
    //             // .data_out(data_out[j * N * 8 +: N * 8])
    //             .data_out(stage3[j * N * 8 +: N * 8])
    //         );
    //     end
    // endgenerate

    transpose #(.N(8), .DATA_WIDTH(N)) transposeInst2(
        .matrix1d(stage3),
        .transposed_matrix1d(data_out)
    );

endmodule