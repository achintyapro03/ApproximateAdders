module rcpfa2_block (
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


    nand_gate nand1(notFOut, a, b);
    not_gate not1(fOut, notFOut);
    
    not_gate not2(notCIn, cIn);
    orAndBlock OA1(Y, a, b, notCIn);
    not_gate not3(notFIn, fIn);
    nand_gate nand2(s, notFIn, Y);
    nand_gate nand3(notCOut, fIn, Y);
    not_gate not4(cOut, notCOut);

endmodule