// Code your design here
// Code your design here
module CU	
  (	
	//input clk,
	input run,
	input resetn,
    input [8:0] ir,
	input [1:0] state,
	output reg ain,
	output reg gin,	
	output reg sub,
	output reg [7:0] rin,	//reg
    output reg [2:0] rout,
	output reg gout,
    output reg din_en,
	output reg ir_en,
	output reg clear,
	output reg done			
	);
  
  //reg [1:0] state;
  wire [2:0] cmd;
  wire [2:0] x1;
  wire [7:0] rx, ry;
  assign cmd = ir[8:6];
  
  always @ (*)
begin
  if (!resetn)
		begin
			ir_en			<= 1'b0		;
			clear			<= 1'b0		;
			din_en			<= 1'b0		;
			gout			<= 1'b0		;
			rout			<= 3'b0		;
			rin				<= 8'b0		;
			ain				<= 1'b0		;
			gin				<= 1'b0		;
			sub				<= 1'b1		;
			done			<= 1'b0		;
		end
	else
	begin
		case (state)
			2'b00: 
				begin
					ir_en			<= 1'b1		;	
					clear			<= 1'b1		;
					gout			<= 1'b0		;
					gin				<= 1'b0		;
					sub				<= 1'b1		;
					done			<= 1'b0		;
                end
					
			2'b01: 
				begin
                  if(!cmd[2] & !cmd[1] & !cmd[0] )	//ir = 3'b000
					begin
						done	<= 1'b1	;
						rout	<= ry;
						rin		<= rx;
					end
					else
                      if ( !cmd[2] & !cmd[1] & cmd[0] ) //ir = 3'b001
						begin
							rin	<= rx;
						end
						else
                          if	( !cmd[2]& cmd[1] & !cmd[0] )//add
                            begin
								din_en			<= 1'b0	;	
                              //rx			<= (rx + ry)	;
                              	done <= 1'b1;
                            end
                  			else
                              if (!cmd[2] & cmd[1] & cmd[0] )
                                begin
                                  //x1 <= rx - ry;
                                  //rx <= x1;
                                  done <= 1'b1;
                                end
							else
								if ( cmd[2] & !cmd[1] & !cmd[0] )	//movo
								begin
									din_en			<= 1'b0		;	
									rout			<= rx		;
									rin				<= 8'b0		;
									ain				<= 1'b1		;
								end
								else
								begin
									din_en			<= din_en	;	
									rout			<= rout		;
									rin				<= rin		;
									ain				<= ain;
								end
				end
			2'b10:
				begin
					ir_en			<= 1'b0		;										clear			<= 1'b1		;
					din_en			<= 1'b0		;
					gout			<= 1'b0		;
					rout			<= ry		;
					rin				<= 8'b0		;
					ain				<= 1'b0		;
					gin				<= 1'b1		;
                  	if (cmd [0])sub	<= 1'b0		;
					else sub		<= 1'b1		;
					done			<= 1'b0		;			
				end
			2'b11: 
				begin
					ir_en			<= 1'b0		;
					clear			<= 1'b1		;
					din_en			<= 1'b1		;
					gout			<= 1'b1		;
					rout			<= 3'b0		;
					rin				<= rx		;
					ain				<= 1'b0		;
					gin				<= 1'b0		;
					sub				<= 1'b1		;
					done			<= 1'b0		;			
				end
		endcase
	end
end
  decode3bits ry_unit (.in (ir[2:0])	, .out (ry));
  decode3bits rx_unit (.in (ir[5:3])	, .out (rx));
endmodule

module decode3bits 	
  (	
    input 	[2:0]	in	,
	output	[7:0]	out	
);

assign out[0]	=	!in[2] & !in[1] & !in[0]	;
assign out[1]	=	!in[2] & !in[1] &  in[0]	;
assign out[2]	=	!in[2] &  in[1] & !in[0]	;
assign out[3]	=	!in[2] &  in[1] &  in[0]	;
assign out[4]	=	 in[2] & !in[1] & !in[0]	;
assign out[5]	=	 in[2] & !in[1] &  in[0]	;
assign out[6]	=	 in[2] &  in[1] & !in[0]	;
assign out[7]	=	 in[2] &  in[1] &  in[0]	;

endmodule
					