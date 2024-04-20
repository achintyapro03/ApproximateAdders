module dct1dTb;
    parameter N = 16;
    integer k;
    reg signed [N * 8 - 1:0] A;
    wire signed [N * 8 - 1:0] B;

    dct1d #(.N(N)) dct1dinst(
        .clk(clk),
        .data_in(A[127 : 0]),
        .data_out(B[127 : 0])
    );

        
    initial begin
        $dumpfile("exe/dct1dTb.vcd");
        $dumpvars(0, dct1dTb);
        
        A = 128'b00000000011001000000000001100110000000000110011100000000011001110000000001100111000000000110100000000000011001110000000001101000;
        #20;
        for (k = 0; k < N * 8; k = k + N) begin
            $display("%d", B[k +: N]);
        end
        $finish;
    end
endmodule