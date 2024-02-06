module dff(d, clk, q, qb);
input d; // Data input 
input clk; // clock input 
output reg q, qb; // output Q 
  always @(posedge clk) 
begin
 q <= d; 
  qb <= ~d;
end 
  
endmodule