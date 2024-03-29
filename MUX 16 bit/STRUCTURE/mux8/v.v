// Code your design here
module mux8 (in0, in1, in2, in3, in4, in5, in6, in7, s, out);
  input in0, in1, in2, in3, in4, in5, in6, in7;
  input [2:0] s;
  output out;
  wire y1, y2, y3, y4, z1, z2;
  
  mux2 n1 (in0, in1, s[0], y1);
  mux2 n2 (in2, in3, s[0], y2);
  mux2 n3 (in4, in5, s[0], y3);
  mux2 n4 (in6, in7, s[0], y4);
  mux2 n5 (y1, y2, s[1], z1);
  mux2 n6 (y3, y4, s[1], z2);
  mux2 n7 (z1, z2, s[2], out);

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