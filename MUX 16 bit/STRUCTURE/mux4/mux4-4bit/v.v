module mux4_4bit (in0, in1, in2, in3, s, out);
  input [3:0] in0, in1, in2, in3;
  input [1:0] s;
  output [3:0] out;
  
  mux4 m1 (in0[0], in1[0], in2[0], in3[0], s, out[0]);
  mux4 m2 (in0[1], in1[1], in2[1], in3[1], s, out[1]);
  mux4 m3 (in0[2], in1[2], in2[2], in3[2], s, out[2]);
  mux4 m4 (in0[3], in1[3], in2[3], in3[3], s, out[3]);
  
endmodule

module mux4 (in0, in1, in2, in3, s, out);
  input in0, in1, in2, in3;
  input [1:0] s;
  output out;
  wire x1, x2;
  
  mux2 m1 (in0, in1, s[0], x1);
  mux2 m2 (in2, in3, s[0], x2);
  mux2 m3 (x1, x2, s[1], out);

endmodule

module mux2 (in1, in2, sel, out);
  input in1, in2, sel;
  output out;
  wire nsel, x1, x2;
  
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