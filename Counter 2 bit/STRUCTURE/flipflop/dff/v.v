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
