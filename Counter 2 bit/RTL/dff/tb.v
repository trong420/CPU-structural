`timescale 1ns/1ps
module counter_tb ();
reg d, clk;
wire q, qb;
  dff dut (.d(d), .clk(clk), .q(q), .qb(qb));
initial begin
clk = 1'b0;
d = 1'b0;
end
  always #14 d = ~d;
  always #5 clk = ~clk;

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  #500 $finish;
end
endmodule