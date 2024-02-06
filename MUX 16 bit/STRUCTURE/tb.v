module mux10_16bit_tb ();
  reg [2:0] rout;
  reg din_en, gout;
  reg [15:0] r0, r1, r2, r3, r4, r5, r6, r7, din, aluout;
  wire [15:0] buswires;
  
  mux10_16bit dut (.r0(r0), .r1(r1), .r2(r2), .r3(r3), .r4(r4), .r5(r5), .r6(r6), .r7(r7), .din(din), .aluout(aluout), .rout(rout), .din_en(din_en), .gout(gout), .buswires(buswires));
  
initial begin
	rout = 0;
  din_en = 0;
  gout = 0;
  
end
  always #5 r0 [15:0] = $random; 
  always #4 r1 [15:0] = $random;
  always #7 r2 [15:0] = $random;
  always #8 r3 [15:0] = $random;
  always #9 r4 [15:0] = $random;
  always #10 r5 [15:0] = $random;
  always #11 r6 [15:0] = $random;
  always #13 r7 [15:0] = $random;
  
  always #14 din [15:0] = $random;
  always #7 aluout [15:0] = $random;
  
  always #13 gout = $random;
  always #21 din_en = $random;
  always #17 rout [2:0] = $random;
  


// create dump file 
initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  #500 $finish;
end