// Code your testbench here
// or browse Examples
module fulladder_tb ();
  reg [15:0] in1, in2; 
  reg sub;
  wire [15:0] s;
  addsub16bit dut (.in1(in1), .in2(in2), .sub(sub), .s(s));
  
initial begin
  in1 = 0;
  in2 = 0;
  sub = 0;
end
  
  always #10 in1 [15:0] = $random;
  always #20 in2 [15:0] = $random;
  always #30 sub = $random;


// create dump file 
initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  #500 $finish;
end
endmodule