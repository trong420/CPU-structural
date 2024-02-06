// Code your testbench here
// or browse Examples
module mux4_tb ();
  reg [1:0] s;
  reg in0, in1, in2, in3;
  wire out;
  mux4 dut (.in0(in0), .in1(in1), .in2(in2), .in3(in3), .s(s), .out(out));
  
initial begin
  in0 = 0;
  in1 = 0;
  in2 = 0;
  in3 = 0;
  s = 2'b00;
end
  always #15 s [1:0] = $random; 
  always #8 in0 = $random;
  always #10 in1 = $random;
  always #12 in2 = $random;
  always #18 in3 = $random;

// create dump file 
initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  #500 $finish;
end
endmodule