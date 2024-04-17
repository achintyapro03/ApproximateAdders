`timescale 1ns/1ps

module nBitRippleCarryAdder #(parameter N = 4)(output[N-1:0] sum,output cout, input[N-1:0] A, input[N-1:0] B,input cin);

    wire[N-1:0] carryMiddle, sum11;

    genvar i;
    generate
        for(i = 0;i < N;i = i+1) begin: genAdder
            if(i == 0)
                FA f(carryMiddle[0], sum11[0], A[0], B[0],cin);
            else
                FA f(carryMiddle[i], sum11[i], A[i], B[i], carryMiddle[i-1]);
        end
    endgenerate

    assign sum = sum11[N-1:0];
    assign cout = carryMiddle[N-1];
endmodule