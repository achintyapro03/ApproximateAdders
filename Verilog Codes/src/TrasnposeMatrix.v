module transpose #(parameter N=8, parameter DATA_WIDTH=8)
	(	
		input  [N*N*DATA_WIDTH-1:0] matrix1d, //input matrix
		output [N*N*DATA_WIDTH-1:0] transposed_matrix1d //transposed matrix
	);
	
	wire [DATA_WIDTH-1:0] Amat [0:N-1][0:N-1]; //Matrix form of the input
	wire [DATA_WIDTH-1:0] Bmat [0:N-1][0:N-1]; //Matrix form of the output
	
	genvar i,j;
	
	generate
		for (i = 0; i < N; i = i + 1) begin: loop1
			for (j = 0; j < N; j = j + 1) begin: loop2
					assign Amat[i][j]=matrix1d[N*N*DATA_WIDTH-N*i*DATA_WIDTH-j*DATA_WIDTH-1:N*N*DATA_WIDTH-N*i*DATA_WIDTH-j*DATA_WIDTH-DATA_WIDTH];
			end
		end
	endgenerate
	
	generate
		for (i = 0; i < N; i = i + 1) begin: loop3
			for (j = 0; j < N; j = j + 1) begin: loop4
					assign Bmat[j][i]=Amat[i][j];
			end
		end
	endgenerate
	
	generate
		for (i = 0; i < N; i = i + 1) begin: loop5
			for (j = 0; j < N; j = j + 1) begin: loop6
					assign transposed_matrix1d[N*N*DATA_WIDTH-N*i*DATA_WIDTH-j*DATA_WIDTH-1:N*N*DATA_WIDTH-N*i*DATA_WIDTH-j*DATA_WIDTH-DATA_WIDTH]=Bmat[i][j];
			end
		end
	endgenerate
	
endmodule