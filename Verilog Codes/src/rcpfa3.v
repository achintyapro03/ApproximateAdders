module rcpfa3_block (
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
    wire notFOut;
    wire notCIn;
    wire notCOut;


    nor_gate nor1(notFOut, a, b);
    not_gate not1(fOut, notFOut);
    
    not_gate not2(notCIn, cIn);
    andOrBlock AO1(X, a, b, notCIn);
    not_gate not3(notFIn, fIn);
    nor_gate nor2(s, notFIn, X);
    nor_gate nor3(notCOut, fIn, X);
    not_gate not4(cOut, notCOut);

endmodule