`timescale 1ns / 1ns 

module tb;

parameter N = 8;

reg [N-1:0] A, B;
wire [N-1:0] sum;

nBitRcpa #(.N(N)) nBitRcpanst(
    .A(A),
    .B(B),
    .sum(sum)
);

initial begin
    $dumpfile("output.vcd");
    $dumpvars(0, tb);

    // A = 4'b0011; B = 4'b0110; #10;
    // A = 8'b01011110; B = 8'b00110010; #10;
    // A = 1'b1; B = 1'b1; #10; 

	A = 8'b00001000; B = 8'b01111010; #10;
	A = 8'b00001101; B = 8'b00010111; #10;
	A = 8'b00011011; B = 8'b01101110; #10;
	A = 8'b01001000; B = 8'b00110110; #10;
	A = 8'b01001100; B = 8'b00010010; #10;
	A = 8'b01110011; B = 8'b01011100; #10;
	A = 8'b00100011; B = 8'b01101001; #10;
	A = 8'b01000010; B = 8'b00000101; #10;
	A = 8'b01010000; B = 8'b00110101; #10;
	A = 8'b01110000; B = 8'b00110100; #10;
	A = 8'b01101101; B = 8'b00001010; #10;
	A = 8'b00110111; B = 8'b01011011; #10;
	A = 8'b00111111; B = 8'b00101011; #10;
	A = 8'b01010101; B = 8'b01010100; #10;
	A = 8'b00100100; B = 8'b00011101; #10;


    $finish;
end

endmodule

// `timescale 1ns / 1ns 

// module tb;

//     reg a, b, cIn, fIn;
//     wire fOut, s, cOut;
//     integer i;

//     rcpfa2_block adder1(
//         .a(a),
//         .b(b),
//         .cIn(cIn),
//         .fIn(fIn),
//         .fOut(fOut),
//         .s(s),
//         .cOut(cOut)
//     );

//     initial begin
//         $dumpfile("output.vcd");
//         $dumpvars(0, tb);

//         a <= 0;
//         b <= 0;
//         cIn <= 0;
//         fIn <= 0;

//         for(i = 0; i < 16; i = i + 1) begin
//             {a, b, cIn, fIn} = i;
//             #10;
//             $display("a=%b b=%b cIn=%b fIn=%b, s=%b cOut=%b fOut=%b", a, b, cIn, fIn, s, cOut, fOut);
//         end
//         $finish;
//     end
// endmodule

