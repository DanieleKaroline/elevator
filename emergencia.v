module emergencia(
	input emerg,clock,
	output reg[0:0] motor1,
	output reg[0:0] motor2,
	output reg[7:0] led
);

always@(posedge clock)
	begin
		if(emerg)
			begin
				led <= 8'b11111111;
				motor1 <= 0;
				motor2 <= 0;
			end
		else led <= 8'b00000000;
	end
endmodule
