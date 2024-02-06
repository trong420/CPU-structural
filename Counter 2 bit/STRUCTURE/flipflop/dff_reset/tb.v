`timescale 1ns/1ps
module counter_tb ();
reg d, clk, clear;
wire q, qb;
  dffr dut (.d(d), .clk(clk), .clear(clear), .q(q), .qb(qb));
initial begin
clk = 1'b0;
d = 1'b0;
  clear = 1'b0;
     #10 clear = 1;
  #10 clear = 0;
  #50 clear = 1;
  #30 clear = 0;
end

  always #14 d = ~d;
  always #5 clk = ~clk;
  
  

initial begin
    $dumpfile("dump.vcd");

    $dumpvars(1);
  #500 $finish;
end
endmodule