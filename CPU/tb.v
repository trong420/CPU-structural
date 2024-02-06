`timescale 1ns/1ps
module CPU_tb ();

reg Clock;
reg Resetn;
reg Run;
  reg [15:0] din;
wire Done;
  wire [15:0] Bus;

  cpu DUT(.Clock(Clock), .DIN(din), .Run(Run), .Resetn(Resetn), .Bus(Bus), .Done(Done));

always #5 Clock = ~Clock;

  	

initial begin
	Clock = 1'b0;
	Run = 1'b0;
  	Resetn = 1'b0;
  	
  	#36 Resetn = 1'b1;
  		Run = 1'b1;
  		din = {7'bz,6'b001000,3'bz};
  		
	#10 din = 16'h000A;
	#10 din = {7'bz,6'b001001,3'bz};
	#10 din = 16'h0008;
	#10 din = {7'bz,6'b001010,3'bz};
	#10 din = 16'h0006;
	#10 din = {7'bz,6'b001011,3'bz};
	#10 din = 16'h0002;
	#10 din = {7'bz,6'b001100,3'bz};
	#10 din = 16'hFFFF;
	#10 din = {7'bz,6'b001101,3'bz};
	#10 din = 16'hEEEE;
	#10 din = {7'bz,6'b001110,3'bz};
	#10 din = 16'hCCCC;
	#10 din = {7'bz,6'b001111,3'bz};
	#10 din = 16'hDDDD;
	#10 din = {7'bz,9'b000111000};
	#20 din = {7'bz,9'b000110001};
	#20 din = {7'bz,9'b000101010};
	#20 din = {7'bz,9'b000100011};
	#20 din = {7'bz,9'b000011111};
	#20 din = {7'bz,9'b000010110};
	#20 din = {7'bz,9'b000001101};
	#20 din = {7'bz,9'b000000100};
	#20 din = {7'bz,9'b010000001};
	#40 din = {7'bz,9'b100111zzz};
	#40 din = {7'bz,9'b010001010};
	#40 din = {7'bz,9'b010010011};
	#40 din = {7'bz,9'b010011100};
	#40 din = {7'bz,9'b010100101};
	#40 din = {7'bz,9'b010101110};
	#40 din = {7'bz,9'b010111001};
	#40 din = {7'bz,9'b011111110};
	#40 din = {7'bz,9'b011110101};
	#40 din = {7'bz,9'b011101100};
	#40 din = {7'bz,9'b011011100};
	#40 din = {7'bz,9'b011100011};
	#40 din = {7'bz,9'b011010011};
	#40 din = {7'bz,9'b011001000};
	#40 din = {7'bz,9'b011000001};
end

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  #1200 $finish;
end

endmodule 