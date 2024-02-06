`timescale 1ns / 1ps

module counter2;

	// Inputs
	reg clk;
	reg reset_bar;

	// Outputs
	wire [1:0] count;

	counter2 (
		.clk(clk), 
		.reset_bar(reset_bar), 
		.count(count)
	);
	
			initial   
		$monitor ("clk = %b, reset_bar = %b,  count=%b", clk, reset_bar, count);


	initial begin
		// Initialize Inputs
		#10 clk = 0;
		reset_bar = 0;

		// Wait 100 ns for global reset to finish
//		#100;
        
		// Add stimulus here
		#10 reset_bar = 1;
			#10 clk = ~clk;
			#10 clk = ~clk;
		#10 reset_bar = 0;	// test the reset
		#10 reset_bar = 1;
		
		forever
			#10 clk = ~clk;	// repetitions that don't go on forever because of 
		end						//  "#150 $stop;" just below
		

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  #500 $finish;
end
//	end
endmodule

  
  
