module testbench; 
  reg clk, reset_n; 
  wire [3:0] q; 

  Count4Down u1(.clk(clk), .reset_n(reset_n), .q(q)); 


  initial
  begin
    $display ("Clk\t reset_n\t count\t ");
    $monitor ("%b\t %b\t\t %b",clk,reset_n,q);
    clk = 0;
    reset_n = 0;
    #10 reset_n = 1;
    #100 reset_n = 0;
    #20 $finish;
  end

  always clk = #1 ~clk;
  
  initial begin
    $dumpfile("dump.vcd");

    $dumpvars(1);
  
end
endmodule