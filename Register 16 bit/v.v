module reg16 (input rin, input clock, input reg [15:0] buswires, output [15:0] r);
  dff_en r0(buswires[0], clock, rin, r[0]);
  dff_en r1(buswires[1], clock, rin, r[1]);
  dff_en r2(buswires[2], clock, rin, r[2]);
  dff_en r3(buswires[3], clock, rin, r[3]);
  dff_en r4(buswires[4], clock, rin, r[4]);
  dff_en r5(buswires[5], clock, rin, r[5]);
  dff_en r6(buswires[6], clock, rin, r[6]);
  dff_en r7(buswires[7], clock, rin, r[7]);
  dff_en r8(buswires[8], clock, rin, r[8]);
  dff_en r9(buswires[9], clock, rin, r[9]);
  dff_en r10(buswires[10], clock, rin, r[10]);
  dff_en r11(buswires[11], clock, rin, r[11]);
  dff_en r12(buswires[12], clock, rin, r[12]);
  dff_en r13(buswires[13], clock, rin, r[13]);
  dff_en r14(buswires[14], clock, rin, r[14]);
  dff_en r15(buswires[15], clock, rin, r[15]);
  

endmodule

module dff_en (input d, input clk, input en, output q);
  dff ff1(f1, clk, q, qb1);
  mux2 m1(q, d, en, f1);

endmodule

module mux2 (in1, in2, sel, out);
  input in1, in2, sel;
  output out;
  notgate m1 (sel, nsel);
  nandgate m2 (in1, nsel, x1);
  nandgate m3 (in2, sel, x2);
  nandgate m4 (x1, x2, out);

endmodule

module dff (d, clk, q, qb);
input d, clk;
output q, qb;
  notgate n1 (d, db);
  nandgate n2 (ckb,d,x);
  nandgate n3 (ckb,db,z);
  nandgate n4 (jb,x,j);
  nandgate n5 (j,z,jb);
  nandgate n6 (clk,j,w);
  nandgate n7 (clk,jb,w1);
  nandgate n8 (w,qb,q);
  nandgate n9 (w1,q,qb);
  notgate n10 (clk, ckb);
endmodule

module nandgate (a, b, y);
  input a, b;
  output y;
  assign y = ~(a&b);
endmodule

module notgate (e, f);
  input e;
  output f;
  assign f = ~e;
endmodule