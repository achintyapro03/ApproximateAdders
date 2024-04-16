`timescale 1ns / 1ns 

module testbenchrca;

parameter N = 8;

reg [N-1:0] A1, B1;
wire [N:0] result;

nBitRippleCarryAdder #(.n(N)) nBitRippleCarryAdderInst(
    .A(A1),
    .B(B1),
    .total(result)
);

initial begin
    $dumpfile("output.vcd");
    $dumpvars(0, testbenchrca);

    // Test vectors with delays
    A1 = 8'b00110000; B1 = 8'b00000101; #10;
    A1 = 8'b01000111; B1 = 8'b01110000; #10;
    A1 = 8'b01000000; B1 = 8'b01110111; #10;
    A1 = 8'b00010100; B1 = 8'b01000010; #10;

    // Finish simulation
    $finish;
end

endmodule
