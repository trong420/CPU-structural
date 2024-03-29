// Code your testbench here
// or browse Examples
module mux8_tb ();
  reg [2:0] s;
  reg [15:0] in0, in1, in2, in3, in4, in5, in6, in7;
  wire [15:0] out;
  mux8_16bit dut (.in0(in0), .in1(in1), .in2(in2), .in3(in3), .in4(in4), .in5(in5), .in6(in6), .in7(in7), .s(s), .out(out));
  
initial begin
  in0 = 0;
  in1 = 0;
  in2 = 0;
  in3 = 0;
  in4 = 0;
  in5 = 0;
  in6 = 0;
  in7 = 0;
  s = 0;
end
  always #5 s [2:0] = $random; 
  always #18 in0 [15:0] = $random;
  always #12 in1 [15:0] = $random;
  always #10 in2 [15:0] = $random;
  always #7 in3 [15:0] = $random;
  always #6 in4 [15:0] = $random;
  always #20 in5 [15:0] = $random;
  always #25 in6 [15:0] = $random;
  always #13 in7 [15:0] = $random;

// create dump file 
initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  #500 $finish;
end
endmodule