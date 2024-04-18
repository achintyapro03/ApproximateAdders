`timescale 1ns / 1ns 

module testbenchhybridfa;

parameter N1= 16,N2=16,addOrSub=0;

reg signed [N1+N2-1:0] A1, B1;
wire signed [N1+N2-1:0] sum1;
wire cout1;

reg signed [N1+N2-1:0] A2, B2;
wire signed [N1+N2 - 1:0] sum2;

assign sum2 = A2 + B2;


HybridAdder #(.N1(N1), .N2(N2), .addOrSub(addOrSub)) HybridAdderInst1(
    .A(A1),
    .B(B1),
    .sum(sum1),
    .cout(cout1)
);


initial begin
    $dumpfile("exe/output_hybrid.vcd");
    $dumpvars(0, testbenchhybridfa);
    // Test vectors with delays
    A1 = 32'b 1010111000110010001000011000001; B1 = 32'b 1110001101111101100000001011101; 
	A2 = 32'b 1010111000110010001000011000001; B2 = 32'b 1110001101111101100000001011101; #10;
	A1 = 32'b 1110100111101111111000000101101; B1 = 32'b 1011000000101000101000000000010; 
	A2 = 32'b 1110100111101111111000000101101; B2 = 32'b 1011000000101000101000000000010; #10;
	A1 = 32'b  101000111010000001010011010110; B1 = 32'b  111001100111100111111101111000; 
	A2 = 32'b  101000111010000001010011010110; B2 = 32'b  111001100111100111111101111000; #10;



    // Finish simulation
    $finish;
end

endmodule