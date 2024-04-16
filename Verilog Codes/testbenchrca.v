`timescale 1ns / 1ns 

module testbenchrca;

parameter N = 8;

reg [N-1:0] A1, B1;
wire [N-1:0] result;
wire cout;
reg carryin;

nBitRippleCarryAdder #(.N(N)) nBitRippleCarryAdderInst(
    .A(A1),
    .B(B1),
    .sum(result),
    .cin(carryin),
    .cout(cout)
);

initial begin
    $dumpfile("output.vcd");
    $dumpvars(0, testbenchrca);

    // Test vectors with delays
    carryin=1'b1;
    A1 = 8'b      11; B1 = 8'b 1010111; #10;
	A1 = 8'b  101011; B1 = 8'b  110001; #10;
	A1 = 8'b 1010001; B1 = 8'b      10; #10;
	A1 = 8'b 1101111; B1 = 8'b  100001; #10;
	A1 = 8'b   10101; B1 = 8'b 1111001; #10;
	A1 = 8'b 1111001; B1 = 8'b 1100010; #10;
	A1 = 8'b  101100; B1 = 8'b  111011; #10;
	A1 = 8'b10000000; B1 = 8'b 1000001; #10;
	A1 = 8'b  111110; B1 = 8'b 1110110; #10;
	A1 = 8'b 1000111; B1 = 8'b 1000010; #10;
	A1 = 8'b 1001100; B1 = 8'b 1100111; #10;
	A1 = 8'b   11001; B1 = 8'b    1001; #10;


    // Finish simulation
    $finish;
end

endmodule
