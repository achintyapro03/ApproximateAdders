module ImageReader;
    integer i, j, m, n, k;
    parameter N = 8;  
    parameter BITS = N * 128 * 128 - 1;

    reg [N - 1:0] pixelReg [127:0][127:0];
    reg [N * 128 * 128 - 1:0] linearPixelReg; 
    reg [N * 8 * 8 - 1:0] window;
    integer linear_index;
    integer reg_offset = 0;

    initial begin
        $readmemb("out.txt", pixelReg);
        
        for (i = 0; i < 128; i = i + 1) begin
            for (j = 0; j < 128; j = j + 1) begin
                linear_index = i * 128 + j;
                reg_offset = linear_index * N;
                linearPixelReg[reg_offset +: N] = pixelReg[i][j];
            end
        end

        for (i = 0; i < 1; i = i + 1) begin
            for (j = 0; j < 1; j = j + 1) begin
                linear_index = 0;
                for (m = 8 * i; m < 8 * (i + 1); m = m + 1) begin
                    for (n = 8 * j; n < 8 * (j + 1); n = n + 1) begin
                        window[(linear_index * N) +: N] = pixelReg[m][n];
                        linear_index = linear_index + 1;
                    end
                end

                // for (k = 0; k < N * 8 * 8; k = k + 8) begin
                //     reg_offset = k;
                //     $display("%d", window[reg_offset +: N]);
                // end

            end
        end

    end
endmodule
