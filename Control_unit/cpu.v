`include "counter.v"
`include "alu.v"
`include "reg16.v"
`include "mux10.v"
`include "control_unit.v"

 
module cpu 	(	input 			Clock		,
						input	[15:0]	DIN		,
						input			Run		,
						input			Resetn	,
             			output	[15:0]	Bus		,
						output			Done
					);
  
  wire [7:0] rin;
  wire [15:0] r0, r1, r2, r3, r4, r5, r6, r7, aluout;
  reg [8:0] ir;
  reg [1:0] state;
  wire sub, ain, gin, gout, din_en, ir_en, clear;

  
  always @ (Clock)					
	begin
      if (ir_en)
		ir	<=	DIN	[8:0]	;
	else
		ir	<= ir		;
	end
  
  CU	CU1
  (	
    .run(Run),
    .resetn(Resetn),
    .ir(ir),
    .state(state),
    .ain(ain),
    .gin(gin),	
    .sub(sub),
    .rin(rin),	
    .rout(rout),
    .gout(gout),
    .din_en(din_en),
    .ir_en(ir_en),
    .clear(clear),
    .done(Done)			
	);
  
  alu alu1(
    .buswire(Bus),
    .clock(Clock),
    .ain(ain),
    .gin(gin),
    .sub(sub),
    .aluout(aluout)
  );
  
  mux10_16bit m1 (
    .r0(r0),
    .r1(r1),
    .r2(r2),
    .r3(r3),
    .r4(r4),
    .r5(r5),
    .r6(r6),
    .r7(r7),
    .din(DIN),
    .aluout(aluout),
    .rout(rout),
    .din_en(din_en),
    .gout(gout),
    .buswires(Bus)
  );
  
  counter c1 (.clear(clear), .clock(Clock), .state(state));
 
  
  reg16 rr0 (.rin(rin[0]), .clock(Clock), .buswires(Bus), .r(r0));
  reg16 rr1 (.rin(rin[1]), .clock(Clock), .buswires(Bus), .r(r1));
  reg16 rr2 (.rin(rin[2]), .clock(Clock), .buswires(Bus), .r(r2));
  reg16 rr3 (.rin(rin[3]), .clock(Clock), .buswires(Bus), .r(r3));
  reg16 rr4 (.rin(rin[4]), .clock(Clock), .buswires(Bus), .r(r4));
  reg16 rr5 (.rin(rin[5]), .clock(Clock), .buswires(Bus), .r(r5));
  reg16 rr6 (.rin(rin[6]), .clock(Clock), .buswires(Bus), .r(r6));
  reg16 rr7 (.rin(rin[7]), .clock(Clock), .buswires(Bus), .r(r7));
     
endmodule
					