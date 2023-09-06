module two_bit_simplest_ctr(clk, reset_bar, count); 
    input clk;												// 
    input reset_bar;
    output reg [1:0] count;											

	 always@(posedge clk,negedge reset_bar)	
		if (~reset_bar)	
			count <= 0;
		else
			count <= count + 1;					
endmodule