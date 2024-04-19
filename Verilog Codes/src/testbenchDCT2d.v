`timescale 1ns / 1ns 

module testbenchDCT2d;

    struct {
        byte val1;
        integer val2;
        string val3;
    } struct_name;
    
    initial begin
        $dumpfile("exe/output_DCT2d.vcd");
        $dumpvars(0, testbenchDCT2d);
        
        

        $finish;
    end

endmodule
