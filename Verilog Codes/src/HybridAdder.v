module HybridAdder #(parameter N1 = 16, N2 = 16, addOrSub = 0)(
        input [N1+N2-1:0] A,
        input [N1+N2-1:0] B,
        output [N1+N2-1:0] sum,
        output cout
    );

    wire [N1+N2-1:0] selectedB;

    if (addOrSub == 0) begin
        assign selectedB = B;
    end else begin
        assign selectedB = ~B + 1'b1;
    end

    wire fn;
    nBitRcpa2 #(.N(N2)) nBitRcpa2Inst(
        .A(A[N2-1:0]),
        .B(selectedB[N2-1:0]),
        .sum(sum[N2-1:0]),
        .fn(fn)
    );
    nBitRippleCarryAdder #(.N(N1)) nBitRippleCarryAdderInst(
        .A(A[N1+N2-1:N2]),
        .B(selectedB[N1+N2-1:N2]),
        .cin(fn),
        .sum(sum[N1+N2-1:N2]),
        .cout(cout)
    ); 
endmodule