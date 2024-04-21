module transpose_tb;

    // Parameters
    parameter N = 8; // Set the size of the matrix
    parameter DATA_WIDTH = 16;
    integer i;

    // Inputs and Outputs
    reg [N*N*DATA_WIDTH-1:0] matrix1d;
    wire [N*N*DATA_WIDTH-1:0] transposed_matrix1d;

    // Instantiate the module under test
    transpose #(N, DATA_WIDTH) transpose_inst (
        .matrix1d(matrix1d),
        .transposed_matrix1d(transposed_matrix1d)
    );

    initial begin
        for (i = 0; i < N * N; i = i + 1) begin
            matrix1d[(i * DATA_WIDTH) +: DATA_WIDTH] <= i; 
        end
        #10;
        for (i = 0; i < N * N; i = i + 1) begin
            $write("%d", matrix1d[(i * DATA_WIDTH) +: DATA_WIDTH]);
            matrix1d[(i * DATA_WIDTH) +: DATA_WIDTH] <= i; 
            if ((i + 1) % N == 0) begin
                $write("\n");
            end else begin
                $write("\t");
            end
        end
        #10;
        for (i = 0; i < N * N; i = i + 1) begin
            $write("%d", transposed_matrix1d[(i * DATA_WIDTH) +: DATA_WIDTH]);
            if ((i + 1) % N == 0) begin
                $write("\n");
            end else begin
                $write("\t");
            end
        end
        $finish;
    end
endmodule
