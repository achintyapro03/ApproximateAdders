module mainTb;
    integer i, j, m, n, k;
    parameter N = 16;  
    parameter BITS = N * 128 * 128 - 1;


    reg clk;    // Clock signal

    reg signed [N - 1:0] pixelReg [127:0][127:0];
    wire signed [N - 1:0] pixelOut [127:0][127:0];
    reg signed [N * 128 * 128 - 1:0] linearPixelReg; 
    reg signed [N * 8 * 8 - 1:0] windowIn;
    wire signed [N * 8 * 8 - 1:0] tempWindowOut;
    reg signed [N - 1:0] windowOut [7:0][7:0];
    integer linear_index;
    integer reg_offset = 0;


    always #10 clk = ~clk; 

    dct2d #(.N(N)) dct2dinst(
        .clk(clk),
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

        for (i = 0; i < 1; i = i + 1) begin
            for (j = 0; j < 1; j = j + 1) begin
                linear_index = 0;
                for (m = 8 * i; m < 8 * (i + 1); m = m + 1) begin
                    for (n = 8 * j; n < 8 * (j + 1); n = n + 1) begin
                        windowIn[(linear_index * N) +: N] = pixelReg[7 - m][7 - n];
                        $display("%d", windowIn[(linear_index * N) +: N]);
                        linear_index = linear_index + 1;
                    end
                end
                $display("\n\n\n");

                for (k = 0; k < N * 8 * 8; k = k + N) begin
                    $display("%d", windowIn[k +: N]);
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
                #100;
                linear_index = 0;
                for (m = 0; m < 8; m = m + 1) begin
                    for (n = 0; n < 8; n = n + 1) begin
                        $write("%d\n", tempWindowOut[linear_index * N +: N]);
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

            end
        end
        // $fopen("out.txt", "wb");
        // #10;
        // $fwrite("out.txt", "%b", pixelOut);
        // #10;
        // $fclose("out.txt"); 
        $finish;
    end
endmodule
