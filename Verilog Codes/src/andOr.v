module andOrBlock(out, a, b, c);
    input a, b, c;
    output out;

    wire node1;
    wire node2;

    nand_gate nand1(node1, a, b);
    not_gate not1(node2, node1);
    nor_gate nor1(out, node2, c);

endmodule