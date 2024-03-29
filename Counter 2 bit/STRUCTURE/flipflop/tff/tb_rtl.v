`timescale 1ns/1ps
module counter_tb ();
reg clk, rstn, t;
wire q;
  tff dut (.clk(clk), .rstn(rstn), .t(t), .q(q));
initial begin
clk = 1'b0;
t = 1'b0;
  rstn = 1'b0;
end
  always #14 t = ~t;
  always #5 clk = ~clk;
  

initial begin
  #75 rstn = 1;
  #5 rstn = 0;
    $dumpfile("dump.vcd");
    $dumpvars(1);
  #500 $finish;
end
endmodule