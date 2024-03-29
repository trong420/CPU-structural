`timescale 1ns/1ps
module reg_tb ();
  reg rin, clock; 
  reg [15:0] buswires;
  wire [15:0] r;
  reg16 dut (.rin(rin), .clock(clock), .buswires(buswires), .r(r));
initial begin
clock = 1'b0;
rin = 1'b0;
  buswires = 1'b0;
  #10 rin = 1'b1;
  #100 rin = 1'b0;
  #10 rin = 1'b1;
  #100 rin = 1'b0;
  


end
  always #10 buswires = buswires + 1'b1;

  always #7 clock = ~clock;
  
  

initial begin
    $dumpfile("dump.vcd");

    $dumpvars(1);
  #500 $finish;
end
endmodule