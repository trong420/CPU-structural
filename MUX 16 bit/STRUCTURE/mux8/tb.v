module mux8_tb ();
  reg [2:0] s;
  reg in0, in1, in2, in3, in4, in5, in6, in7;
  wire out;
  mux8 dut (.in0(in0), .in1(in1), .in2(in2), .in3(in3), .in4(in4), .in5(in5), .in6(in6), .in7(in7), .s(s), .out(out));
  
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
  always #18 in0 = $random;
  always #12 in1 = $random;
  always #10 in2 = $random;
  always #7 in3 = $random;
  always #6 in4 = $random;
  always #20 in5 = $random;
  always #25 in6 = $random;
  always #13 in7 = $random;

// create dump file 
initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  #500 $finish;
end
endmodule