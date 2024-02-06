// Code your testbench here
// or browse Examples
module alu_tb ();
  reg [15:0] buswire; 
  reg clock, ain, gin, sub;
  wire [15:0] aluout;
  alu dut (.buswire(buswire), .clock(clock), .ain(ain), .gin(gin), .sub(sub), .aluout(aluout));
  
initial begin
  ain = 0;
  gin = 0;
  clock = 0;
  sub = 0;
end
  
  always #25 buswire [15:0] = $random;
  always #42 ain = $random;
  always #33 gin = $random;
  always #67 sub = $random;
  always #20 clock = ~clock;


// create dump file 
initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  #500 $finish;
end
endmodule