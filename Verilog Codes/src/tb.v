`timescale 1ns / 1ns 

module tb;

parameter N = 8;

reg [N-1:0] A1, B1;
wire [N-1:0] sum1;
wire fn1;
integer i, j;
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

// File operation variables
reg [N-1:0] A, B;
reg [N-1:0] sumActualFile, sum1File, sum2File, sum3File;
reg [1:0] counter;

// CSV file writing task
task write_to_csv;
    $fwrite(csv_file, "%d, %d, %d, %d, %d, %d, %d\n", 
        counter, A, B, sumActualFile, sum1File, sum2File, sum3File);
endtask

// Initial block to set up file and execute test cases
initial begin
    // Open CSV file for writing
    csv_file = $fopen("output.csv", "w");

    // Write CSV file header
    $fwrite(csv_file, "Test, A, B, SumActual, Sum1, Sum2, Sum3 \n");

    // Set up dumpfile for waveform
    $dumpfile("exe/output_adder_comp.vcd");
    $dumpvars(0, tb);

    // Execute test cases
    counter = 0;

    // Loop through all possible combinations of A and B where sum < 255
    
    for (i = 0; i < 128; i = i + 1) begin
        for (j = 0; j < 128; j = j + 1) begin
            if (i + j < 255) begin
                A = i;
                B = j;
                A1 = A; B1 = B; A2 = A; B2 = B; A3 = A; B3 = B;
                #10;
                sumActualFile = A + B;
                sum1File = sum1;
                sum2File = sum2;
                sum3File = sum3;
                write_to_csv;
                counter = counter + 1;
            end
        end
    end

    // Close CSV file
    $fclose(csv_file);

    // Finish simulation
    $finish;
end

// Declaration of CSV file handle
integer csv_file;

endmodule
