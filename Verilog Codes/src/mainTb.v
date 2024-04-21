module mainTb;
    integer i, j, m, n, k;
    parameter N = 16;  
    parameter BITS = N * 128 * 128 - 1;

    integer outFile;

    reg clk;    // Clock signal

    reg signed [N - 1:0] pixelReg [127:0][127:0];
    reg signed [N - 1:0] pixelOut [127:0][127:0];
    reg signed [N * 128 * 128 - 1:0] linearPixelReg;
    reg signed [N * 128 * 128 - 1:0] linearPixelOut; 

    reg signed [N * 8 * 8 - 1:0] windowIn;
    wire signed [N * 8 * 8 - 1:0] tempWindowOut;
    reg signed [N - 1:0] windowOut [7:0][7:0];
    integer linear_index;
    integer reg_offset = 0;

    dct2d #(.N(N)) dct2dinst(
        .data_in(windowIn),
        .data_out(tempWindowOut)
    );

    initial begin
        $dumpfile("exe/output_mainTb.vcd");
        $dumpvars(0, mainTb);    
        $readmemb("src/in.txt", pixelReg);
        
        // for (i = 0; i < 128; i = i + 1) begin
        //     for (j = 0; j < 128; j = j + 1) begin
        //         linear_index = i * 128 + j;
        //         reg_offset = linear_index * N;
        //         linearPixelReg[reg_offset +: N] = pixelReg[i][j];
        //     end
        // end
        $display("hello");
        for (i = 0; i < 4; i = i + 1) begin
            for (j = 0; j < 4; j = j + 1) begin
                linear_index = 63;
                for (m = 8 * i; m < 8 * (i + 1); m = m + 1) begin
                    for (n = 8 * j; n < 8 * (j + 1); n = n + 1) begin
                        windowIn[(linear_index * N) +: N] = pixelReg[m][n];
                        // $display("%d", windowIn[(linear_index * N) +: N]);
                        // $display("%d", pixelReg[8*i + 7 - m][8 * j + 7 - n]);
                        linear_index = linear_index - 1;
                    end
                end
                // $display("\n\n\n");


                for (k = 0; k < N * 8 * 8; k = k + N) begin
                    $write("%d", windowIn[k +: N]);
                    if (k % N * 8 == 0) begin
                        $write("\n");
                    end else begin
                        $write("\t");
                    end
                end
                $display("\n\n\n");

                // #20;
                // linear_index = 0;
                // for (m = 8 * i; m < 8 * (i + 1); m = m + 1) begin
                //     for (n = 8 * j; n < 8 * (j + 1); n = n + 1) begin
                //         pixelOut[m][n] <= windowOut[(linear_index * N) +: N];
                //         linear_index = linear_index + 1;
                //     end
                // end
                #1;
                linear_index = 0;
                for (m = 0; m < 8; m = m + 1) begin
                    for (n = 0; n < 8; n = n + 1) begin
                        // $write("%d\n", tempWindowOut[linear_index * N +: N]);
                        windowOut[7 - m][7 - n] = tempWindowOut[linear_index * N +: N];
                        linear_index = linear_index + 1;
                    end
                end
                for (m = 0; m < 8; m = m + 1) begin
                    for (n = 0; n < 8; n = n + 1) begin
                        $write("%d ", windowOut[m][n]);
                    end
                    $write("\n");
                end
                for (m = 8 * i; m < 8 * (i + 1); m = m + 1) begin
                    for (n = 8 * j; n < 8 * (j + 1); n = n + 1) begin
                        pixelOut[7 - m][7 - n] = windowOut[m][n];
                    end
                end
            end
        end
        linear_index = 0;
        for (i = 0; i < 128; i = i + 1) begin
            for (j = 0; j < 128; j = j + 1) begin
                linear_index = i * 128 + j;
                reg_offset = linear_index * N;
                linearPixelOut[reg_offset +: N] = pixelOut[i][j];
            end
        end
        outFile = $fopen("src/out.txt", "wb");
        #10;
        $fwrite(outFile,"%b",linearPixelOut);        #10;
        $fclose(outFile); 
        $finish;
    end
endmodule
