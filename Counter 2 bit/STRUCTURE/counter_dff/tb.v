`timescale 1ns/1ps
module counter_tb ();
reg clock, clear;
  wire [1:0] state;
  counter2 dut (.clear(clear), .clock(clock), .state(state));
initial begin
clock = 1'b0;
clear = 1'b0;
  #18 clear = 1;
  #47 clear = 0;
  #34 clear = 1;
  #22 clear = 0;
end

  always #10 clock = ~clock;
  
  

initial begin
    $dumpfile("dump.vcd");

    $dumpvars(1);
  #500 $finish;
end
endmodule