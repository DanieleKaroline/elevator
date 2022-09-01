module BC_elevador(
	input s,d,b1,b2,b3,b4,sp,spe,clock,sen1,sen2,sen3,sen4,reset,emerg,
	output reg[8:0] led,
	output reg[6:0] b,
	output reg[6:0] c,
	output reg[6:0] e,
	output reg[0:0]motor1, 
	output reg[0:0]motor2,
	output reg[0:0]porta
);
reg[1:0] de;
reg[3:0] state = 4'b0000;

always@(posedge clock)
	begin
	
		if(reset) begin 
			state <= 4'b0000;
			de = 2'b11;
					end

		case(state)
			4'b0000: begin
				
				b <= 7'b1000000;
				de = 2'b11;
				motor1 <= 0;
				motor2 <= 0;
				
				if(sen1) c <= 7'b1111001;
				else if(sen2) c <= 7'b0100100;
				else if(sen3) c <= 7'b0110000;
				else if(sen4) c <= 7'b0011001;
				
				case(de)
					2'b00: e <= 7'b1111001;
					2'b01: e <= 7'b0100100;
					2'b10: e <= 7'b0110000;
					2'b11: e <= 7'b0011001;
				endcase
					
				if(sp) porta <= 1;
				if(~sp) porta <= 0;
				if(spe) porta <= 1;
				if(s==1) state <= 4'b0001;
				if(d==1) state <= 4'b0010;
						end
			
			4'b0001: begin
				b <= 7'b1111001;
				
				if(sen1) c <= 7'b1111001;
				else if(sen2) c <= 7'b0100100;
				else if(sen3) c <= 7'b0110000;
				else if(sen4) c <= 7'b0011001;
				
				case(de)
					2'b00: e <= 7'b1111001;
					2'b01: e <= 7'b0100100;
					2'b10: e <= 7'b0110000;
					2'b11: e <= 7'b0011001;
				endcase
				
				if(sp) porta <= 1;
				if(~sp) porta <= 0;
				if(spe) porta <= 1;
				if(sp==0 && spe==0) state <= 4'b0011;
						end
					
			4'b0010: begin
				b <= 7'b0100100;
				
				if(sen1) c <= 7'b1111001;
				else if(sen2) c <= 7'b0100100;
				else if(sen3) c <= 7'b0110000;
				else if(sen4) c <= 7'b0011001;
				
				case(de)
					2'b00: e <= 7'b1111001;
					2'b01: e <= 7'b0100100;
					2'b10: e <= 7'b0110000;
					2'b11: e <= 7'b0011001;
				endcase
				
				if(sp) porta <= 1;
				if(~sp) porta <= 0;
				if(spe) porta <= 1;
				if(sp==0 && spe==0) state <= 4'b0100;				
						end
						
			4'b0011: begin
				b <= 7'b0110000;
				
				case(de)
					2'b00: e <= 7'b1111001;
					2'b01: e <= 7'b0100100;
					2'b10: e <= 7'b0110000;
					2'b11: e <= 7'b0011001;
				endcase
				
				if(sen1) c <= 7'b1111001;
				else if(sen2) c <= 7'b0100100;
				else if(sen3) c <= 7'b0110000;
				else if(sen4) c <= 7'b0011001;
				
				motor1 <= 0;
				motor2 <= 1;
				state <= 4'b0101;				
						end
						
			4'b0100: begin
				b <= 7'b0011001;
				
				if(sen1) c <= 7'b1111001;
				else if(sen2) c <= 7'b0100100;
				else if(sen3) c <= 7'b0110000;
				else if(sen4) c <= 7'b0011001;
				
				case(de)
					2'b00: e <= 7'b1111001;
					2'b01: e <= 7'b0100100;
					2'b10: e <= 7'b0110000;
					2'b11: e <= 7'b0011001;
				endcase
				
				motor1 <= 1;
				motor2 <= 0;
				state <= 4'b0101;				
						end
						
			4'b0101: begin
				b <= 7'b0010010;

				if(sen1) c <= 7'b1111001;
				else if(sen2) c <= 7'b0100100;
				else if(sen3) c <= 7'b0110000;
				else if(sen4) c <= 7'b0011001;
				
				case(de)
					2'b00: e <= 7'b1111001;
					2'b01: e <= 7'b0100100;
					2'b10: e <= 7'b0110000;
					2'b11: e <= 7'b0011001;
				endcase
				
				if(sen1) begin
					if (de == 2'b00) state <= 4'b0110;
							end
				if(sen2) begin
					if (de == 2'b01) state <= 4'b0110;
							end
				if(sen3) begin
					if (de == 2'b10) state <= 4'b0110;
							end
				if(sen4) begin
					if (de == 2'b11) state <= 4'b0110;
							end
						end
				
			4'b0110: begin
				b <= 7'b0000010;

				if(sen1) c <= 7'b1111001;
				else if(sen2) c <= 7'b0100100;
				else if(sen3) c <= 7'b0110000;
				else if(sen4) c <= 7'b0011001;
				
				case(de)
					2'b00: e <= 7'b1111001;
					2'b01: e <= 7'b0100100;
					2'b10: e <= 7'b0110000;
					2'b11: e <= 7'b0011001;
				endcase
				
				motor1 <= 0;
				motor2 <= 0;
				state <= 4'b0111;				
						end
						
			4'b0111: begin
				b <= 7'b1111000;

				if(sen1) c <= 7'b1111001;
				else if(sen2) c <= 7'b0100100;
				else if(sen3) c <= 7'b0110000;
				else if(sen4) c <= 7'b0011001;
				
				case(de)
					2'b00: e <= 7'b1111001;
					2'b01: e <= 7'b0100100;
					2'b10: e <= 7'b0110000;
					2'b11: e <= 7'b0011001;
				endcase
				
				if(sp) porta <= 1;
				if(~sp) porta <= 0;
				if(spe) porta <= 1;
				state <= 4'b1000;	
						end
				
			4'b1000: begin
				b <= 7'b000000;

				if(sen1) c <= 7'b1111001;
				else if(sen2) c <= 7'b0100100;
				else if(sen3) c <= 7'b0110000;
				else if(sen4) c <= 7'b0011001;
				
				case(de)
					2'b00: e <= 7'b1111001;
					2'b01: e <= 7'b0100100;
					2'b10: e <= 7'b0110000;
					2'b11: e <= 7'b0011001;
				endcase
				
				if(sp) porta <= 1;
				if(~sp) porta <= 0;
				if(spe) porta <= 1;
				
				if(sen1) begin
					if(~b2)      begin 
										state <= 4'b0001;
										de = 2'b01;
									end
					else if(~b3) begin
										state <= 4'b0001;
										de = 2'b10;
									end
					else if(~b4) begin
										state <= 4'b0001;
										de = 2'b11;
									end
							end
							
				if(sen2) begin
					if(~b1) begin
								state <= 4'b0010;
								de = 2'b00;
							end
					else if(~b3) begin
										state <= 4'b0001;
										de = 2'b10;
									end
					else if(~b4) begin
										state <= 4'b0001;
										de = 2'b11;
									end
							end					
				if(sen3) begin
					if(~b1) begin
								state <= 4'b0010;
								de = 2'b00;
							end
					else if(~b2) begin
										state <= 4'b0010;
										de = 2'b01;
									end
					else if(~b4) begin
										state <= 4'b0001;
										de = 2'b11;
									end
							end
							
				if(sen4) begin
					if(~b1)      begin 
										state <= 4'b0010;
										de = 2'b00;
									end
					else if(~b2) begin
										state <= 4'b0010;
										de = 2'b01;
									end
					else if(~b3) begin
										state <= 4'b0010;
										de = 2'b10;
									end
							end
						end	
		endcase
		
		if(emerg)
			begin
				led <= 8'b11111111;
				motor1 <= 0;
				motor2 <= 0;
			end
		else led <= 8'b00000000;
	
	end
endmodule
