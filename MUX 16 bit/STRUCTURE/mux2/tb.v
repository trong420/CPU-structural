module mux2_tb ();
reg in1, in2, sel;
  wire out;
  mux2 dut (.in1(in1), .in2(in2), .sel(sel), .out(out));
initial begin
in1 = 1'b0;
in2 = 1'b1;
  sel = 1'b0;
end
always #5 sel = ~sel;
initial begin
#50 in2 = 1'b0; 
#1 in1 = 1'b1; 
#500 $finish;
end
// create dump file 
initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
end
endmodule