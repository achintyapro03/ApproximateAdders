module rcpfa1_block (
    input a,
    input b,
    input cIn,
    input fIn,
    output fOut,
    output s,
    output cOut
);
    wire X;
    wire Y;
    wire notFIn;
    wire notCIn;
    wire notCOut;


    assign fOut = a;
    not_gate not1(notCIn, cIn);
    andOrBlock AO1(X, a, b, notCIn);
    orAndBlock OA1(Y, a, b, notCIn);
    not_gate not2(notFIn, fIn);
    orAndBlock OA2(s, notFIn, X, Y);
    andOrBlock AO2(notCOut, fIn ,Y, X);
    not_gate not3(cOut, notCOut);

endmodule