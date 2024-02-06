`timescale 1ns/1ps
module counter_tb ();
reg t, clk, clear;
wire q, qb;
  tff dut (.t(t), .clk(clk), .clear(clear), .q(q), .qb(qb));
initial begin
clk = 1'b0;
t = 1'b0;
  clear = 1'b0;
     #10 clear = 1;
  #10 clear = 0;
  #50 clear = 1;
  #30 clear = 0;
end

  always #14 t = ~t;
  always #5 clk = ~clk;
  
  

initial begin
    $dumpfile("dump.vcd");

    $dumpvars(1);
  #500 $finish;
end
endmodule