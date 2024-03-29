// Code your design here
module addsub16bit (in1, in2, sub, s);
  input [15:0] in1, in2; 
  input sub;
  output [15:0] s;
  wire x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15; 
  wire c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15;
  
  xorgate n0 (sub, in2[0], x0);
  xorgate n1 (sub, in2[1], x1);
  xorgate n2 (sub, in2[2], x2);
  xorgate n3 (sub, in2[3], x3);
  xorgate n4 (sub, in2[4], x4);
  xorgate n5 (sub, in2[5], x5);
  xorgate n6 (sub, in2[6], x6);
  xorgate n7 (sub, in2[7], x7);
  xorgate n8 (sub, in2[8], x8);
  xorgate n9 (sub, in2[9], x9);
  xorgate n10 (sub, in2[10], x10);
  xorgate n11 (sub, in2[11], x11);
  xorgate n12 (sub, in2[12], x12);
  xorgate n13 (sub, in2[13], x13);
  xorgate n14 (sub, in2[14], x14);
  xorgate n15 (sub, in2[15], x15);
  
  fulladder a0 (in1[0], x0, sub, c1, s[0]);
  fulladder a1 (in1[1], x1, c1, c2, s[1]);
  fulladder a2 (in1[2], x2, c2, c3, s[2]);
  fulladder a3 (in1[3], x3, c3, c4, s[3]);
  fulladder a4 (in1[4], x4, c4, c5, s[4]);
  fulladder a5 (in1[5], x5, c5, c6, s[5]);
  fulladder a6 (in1[6], x6, c6, c7, s[6]);
  fulladder a7 (in1[7], x7, c7, c8, s[7]);
  fulladder a8 (in1[8], x8, c8, c9, s[8]);
  fulladder a9 (in1[9], x9, c9, c10, s[9]);
  fulladder a10 (in1[10], x10, c10, c11, s[10]);
  fulladder a11 (in1[11], x11, c11, c12, s[11]);
  fulladder a12 (in1[12], x12, c12, c13, s[12]);
  fulladder a13 (in1[13], x13, c13, c14, s[13]);
  fulladder a14 (in1[14], x14, c14, c15, s[14]);
  fulladder a15 (in1[15], x15, c15, , s[15]);
  
endmodule

module fulladder (in1, in2, cin, cout, s);
  input in1, in2, cin;
  output s, cout;
  wire x1, x2, x3;
  
  xorgate n1 (in1, in2, x1);
  andgate n2 (in1, in2, x2);
  xorgate n3 (x1, cin, s);
  andgate n4 (x1, cin, x3);
  orgate n5 (x2, x3, cout);

endmodule

module andgate (a, b, y);
  input a, b;
  output y;
  assign y = (a&b);
endmodule

module orgate (a, b, y);
  input a, b;
  output y;
  assign y = a|b;
endmodule

module xorgate (a, b, y);
  input a, b;
  output y;
  assign y = a^b;
endmodule

