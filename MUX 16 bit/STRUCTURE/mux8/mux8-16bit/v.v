module mux8_16bit (in0, in1, in2, in3, in4, in5, in6, in7, s, out);
  input [15:0] in0, in1, in2, in3, in4, in5, in6, in7;
  input [2:0] s;
  output [15:0] out;
  wire y1, y2, y3, y4, z1, z2;
  
  mux8 m0 (in0[0], in1[0], in2[0], in3[0], in4[0], in5[0], in6[0], in7[0], s, out[0]);  
  mux8 m1 (in0[1], in1[1], in2[1], in3[1], in4[1], in5[1], in6[1], in7[1], s, out[1]);
  mux8 m2 (in0[2], in1[2], in2[2], in3[2], in4[2], in5[2], in6[2], in7[2], s, out[2]);
  mux8 m3 (in0[3], in1[3], in2[3], in3[3], in4[3], in5[3], in6[3], in7[3], s, out[3]);
  mux8 m4 (in0[4], in1[4], in2[4], in3[4], in4[4], in5[4], in6[4], in7[4], s, out[4]);
  mux8 m5 (in0[5], in1[5], in2[5], in3[5], in4[5], in5[5], in6[5], in7[5], s, out[5]);
  mux8 m6 (in0[6], in1[6], in2[6], in3[6], in4[6], in5[6], in6[6], in7[6], s, out[6]);
  mux8 m7 (in0[7], in1[7], in2[7], in3[7], in4[7], in5[7], in6[7], in7[7], s, out[7]);
  mux8 m8 (in0[8], in1[8], in2[8], in3[8], in4[8], in5[8], in6[8], in7[8], s, out[8]);
  mux8 m9 (in0[9], in1[9], in2[9], in3[9], in4[9], in5[9], in6[9], in7[9], s, out[9]);
  mux8 m10 (in0[10], in1[10], in2[10], in3[10], in4[10], in5[10], in6[10], in71[0], s, out[10]);
  mux8 m11 (in0[11], in1[11], in2[11], in3[11], in4[11], in5[11], in6[11], in7[11], s, out[11]);
  mux8 m12 (in0[12], in1[12], in2[12], in3[12], in4[12], in5[12], in6[12], in7[12], s, out[12]);
  mux8 m13 (in0[13], in1[13], in2[13], in3[13], in4[13], in5[13], in6[13], in7[13], s, out[13]);
  mux8 m14 (in0[14], in1[14], in2[14], in3[14], in4[14], in5[14], in6[14], in7[14], s, out[14]);
  mux8 m15 (in0[15], in1[15], in2[15], in3[15], in4[15], in5[15], in6[15], in7[15], s, out[15]);


endmodule

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