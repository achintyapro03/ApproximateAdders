module not_gate(out, a);
   input a;
   output out;
   assign out = ~a;  
endmodule

module nand_gate(out, a, b);
   input a, b;
   output out;
   assign out = ~(a & b);  
endmodule

module nor_gate(out, a, b);
   input a, b;
   output out;
   assign out = ~(a | b);  
endmodule
