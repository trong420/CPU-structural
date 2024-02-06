// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
module CUnit_tb ();
  reg [8:0] ir;
  reg [1:0] state;
  reg run, resetn;
  wire ain, gin, sub, din_en, ir_en, gout, clear, done;
  wire [7:0] rin;
  wire [2:0] rout;
  
  CU dut (.run(run), .resetn(resetn), .ir(ir), .state(state), .ain(ain), .gin(gin), .sub(sub), .rin(rin), .rout(rout), .gout(gout), .din_en(din_en), .ir_en(ir_en), .clear(clear), .done(done));
  
initial begin
  run = 0;
  resetn = 0;
  ir = 0;
  state = 1;

end
  always #15 ir [8:0] = $random; 
  always #58 run = ~run;
  always #12 resetn = ~resetn;
  always #30 state [1:0] = $random;


// create dump file 
initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  #500 $finish;
end
endmodule