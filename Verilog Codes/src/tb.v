`timescale 1ns / 1ns 

module tb;

parameter N = 8;

reg [N-1:0] A1, B1;
wire [N-1:0] sum1;
wire fn1;

reg [N-1:0] A2, B2;
wire [N-1:0] sum2;
wire fn2;

reg [N-1:0] A3, B3;
wire [N-1:0] sum3;
wire fn3;

wire [N-1:0] sumActual;
assign sumActual = A1 + B1;

nBitRcpa1 #(.N(N)) nBitRcpa1Inst(
    .A(A1),
    .B(B1),
    .sum(sum1),
	.fn(fn1)
);

nBitRcpa2 #(.N(N)) nBitRcpa2Inst(
    .A(A2),
    .B(B2),
    .sum(sum2),
	.fn(fn2)
);

nBitRcpa3 #(.N(N)) nBitRcpa3Inst(
    .A(A3),
    .B(B3),
    .sum(sum3),
	.fn(fn3)
);


initial begin
    $dumpfile("exe/output_adder_comp.vcd");
    $dumpvars(0, tb);

    // A = 4'b0011; B = 4'b0110; #10;
    // A = 8'b01011110; B = 8'b00110010; #10;
    // A = 1'b1; B = 1'b1; #10; 

	A1 = 8'b  110010; B1 = 8'b       1; 
	A2 = 8'b  110010; B2 = 8'b       1;
	A3 = 8'b  110010; B3 = 8'b       1; #10;
	A1 = 8'b 1010001; B1 = 8'b   10010; 
	A2 = 8'b 1010001; B2 = 8'b   10010;
	A3 = 8'b 1010001; B3 = 8'b   10010; #10;
	A1 = 8'b  111100; B1 = 8'b 1010001; 
	A2 = 8'b  111100; B2 = 8'b 1010001;
	A3 = 8'b  111100; B3 = 8'b 1010001; #10;
	A1 = 8'b 1100111; B1 = 8'b 1100001; 
	A2 = 8'b 1100111; B2 = 8'b 1100001;
	A3 = 8'b 1100111; B3 = 8'b 1100001; #10;
	A1 = 8'b 1001011; B1 = 8'b   10101; 
	A2 = 8'b 1001011; B2 = 8'b   10101;
	A3 = 8'b 1001011; B3 = 8'b   10101; #10;
	A1 = 8'b    1011; B1 = 8'b   10111; 
	A2 = 8'b    1011; B2 = 8'b   10111;
	A3 = 8'b    1011; B3 = 8'b   10111; #10;
	A1 = 8'b 1111101; B1 = 8'b  100001; 
	A2 = 8'b 1111101; B2 = 8'b  100001;
	A3 = 8'b 1111101; B3 = 8'b  100001; #10;
	A1 = 8'b 1110010; B1 = 8'b 1000011; 
	A2 = 8'b 1110010; B2 = 8'b 1000011;
	A3 = 8'b 1110010; B3 = 8'b 1000011; #10;
	A1 = 8'b   10000; B1 = 8'b  111000; 
	A2 = 8'b   10000; B2 = 8'b  111000;
	A3 = 8'b   10000; B3 = 8'b  111000; #10;
	A1 = 8'b  100011; B1 = 8'b  110010; 
	A2 = 8'b  100011; B2 = 8'b  110010;
	A3 = 8'b  100011; B3 = 8'b  110010; #10;
	A1 = 8'b  100101; B1 = 8'b    1000; 
	A2 = 8'b  100101; B2 = 8'b    1000;
	A3 = 8'b  100101; B3 = 8'b    1000; #10;
	A1 = 8'b 1101010; B1 = 8'b 1001100; 
	A2 = 8'b 1101010; B2 = 8'b 1001100;
	A3 = 8'b 1101010; B3 = 8'b 1001100; #10;




    $finish;
end

endmodule