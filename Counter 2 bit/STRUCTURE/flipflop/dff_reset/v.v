module dffr (d, clk, clear, q, qb);
input d, clk, clear;
output q, qb;
  notgate a1 (clear, c1);
  nand2gate n1 (x2, x4, x1);
  nand3gate n2 (x1, clk, c1, x2);
  nand3gate n3 (x2, clk, x4, x3);
  nand3gate n4 (d, x3, c1, x4);
  nand2gate n5 (x2, qb, q);
  nand3gate n6 (q, x3, c1, qb);

endmodule

module nand3gate (a, b, c, y);
  input a, b, c;
  output y;
  assign y = ~(a&b&c);
endmodule

module nand2gate (a, b, y);
  input a, b;
  output y;
  assign y = ~(a&b);
endmodule

module notgate (e, f);
  input e;
  output f;
  assign f = ~e;
endmodule
