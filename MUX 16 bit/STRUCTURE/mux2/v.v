// Code your design here
module mux2 (in1, in2, sel, out);
  input in1, in2, sel;
  output out;
  notgate n1 (sel, nsel);
  nandgate n2 (in1, nsel, x1);
  nandgate n3 (in2, sel, x2);
  nandgate n4 (x1, x2, out);

endmodule

module nandgate (a, b, y);
  input a, b;
  output y;
  assign y = ~(a&b);
endmodule

module notgate (a, b);
  input a;
  output b;
  assign b = ~a;
endmodule