module dct2d #(parameter N = 16)( 
        input clk,			                                  	   //	input clock
		input [N * 8 * 8 - 1:0] data_in,	                                           //	N-bit data input		                                           //	3-bit address for data input
		output [N * 8 * 8 - 1:0] data_out                                           //	N-bit data output
	);

    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin: dct1dloop
            dct1d #(.N(N)) dct1dinst(
                .clk(clk),
                .data_in(data_in[i * N * 8 +: N * 8]),
                .data_out(data_out[i * N * 8 +: N * 8])
            );
        end
    endgenerate

endmodule