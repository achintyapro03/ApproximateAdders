module HybridAdder #(parameter N1 = 16, N2 = 16)(
    input [N1+N2-1:0] A,
    input [N1+N2-1:0] B,
    output [N1+N2-1:0] sum,
    output cout
);
wire fn;
nBitRcpa2 #(.N(N2)) nBitRcpa2Inst(
    .A(A[N2-1:0]),
    .B(B[N2-1:0]),
    .sum(sum[N2-1:0]),
	.fn(fn)
);
nBitRippleCarryAdder #(.N(N1)) nBitRippleCarryAdderInst(
    .A(A[N1+N2-1:N2]),
    .B(B[N1+N2-1:N2]),
    .cin(fn),
    .sum(sum[N1+N2-1:N2]),
    .cout(cout)
); 
endmodule