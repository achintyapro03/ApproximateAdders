module nBitRcpa2 #(parameter N = 8)(
    input [N-1:0] A, 
    input [N-1:0] B, 
    output [N-1:0] sum,
    output fn
);

wire [N:0] carry;
wire [N:0] F;

assign carry[N] = F[N];
assign F[0] = 1'b0;
assign fn = F[N];
genvar i;
generate
    for (i = N - 1; i >= 0; i = i - 1) begin: rcpa2Loop
        rcpfa2_block rcpfa2_inst(
            .a(A[i]),
            .b(B[i]),
            .cIn(carry[i + 1]),
            .fIn(F[i]),
            .fOut(F[i + 1]),
            .s(sum[i]),
            .cOut(carry[i])
        );
    end
endgenerate

endmodule
