`timescale 1ns / 1ns 

module testbenchDCT2d;

    initial begin
        $dumpfile("exe/output_DCT2d.vcd");
        $dumpvars(0, testbenchDCT2d);
        
        

        $finish;
    end

endmodule
