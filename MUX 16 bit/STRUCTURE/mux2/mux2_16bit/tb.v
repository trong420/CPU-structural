module mux2_tb ();
  reg [15:0] in0, in1;
  reg s;
  wire [15:0] out;
  mux2_16bit dut (.in0(in0), .in1(in1), .s(s), .out(out));

  initial begin
  in0 = 0;
  in1 = 0;
  s = 0;
end
  always #5 s = $random; 
  always #8 in0 [15:0] = $random;
  always #10 in1 [15:0] = $random;
// create dump file 
initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  #500 $finish;
end
endmodule