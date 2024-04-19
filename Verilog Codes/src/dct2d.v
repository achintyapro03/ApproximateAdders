module dct2d #(parameter N = 16)( 
        input clk,			                                  	   //	input clock
		input reset,		  	                                   //	reset
		input wr,		                                           //	writing data to memory
		input data_in,	                                           //	N-bit data input		                                           //	3-bit address for data input
		output data_out                                           //	N-bit data output
	);

    // reg [N-1:0] pixelReg [7:0][7:0];

    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin: dct1dloop
            dct1d #(.N(N)) dct1dinst(
                .clk(clk),
                .reset(reset),
                .wr(wr),
                .data_in(data_in[i][7:0]),
                .data_out(data_out[i][7:0]),
            );
        end
    endgenerate

endmodule