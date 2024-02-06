`timescale 1ns/1ps
module counter_tb ();
reg clk, j, k, clear;
  wire q, qb;
  jkff dut (.j(j), .k(k), .clk(clk), .clear(clear), .q(q), .qb(qb));
initial begin
clk = 1'b0;
clear = 1'b0;
  j = 0;
  k = 0;
  #18 clear = 1;
  #47 clear = 0;
  #34 clear = 1;
  #22 clear = 0;
end

  always #10 clk = ~clk;
  always #23 k = ~k;
  always #31 j = ~j;
  
  

initial begin
    $dumpfile("dump.vcd");

    $dumpvars(1);
  #500 $finish;
end
endmodule