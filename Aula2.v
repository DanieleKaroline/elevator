module Aula2(
	//input SW[0], SW[1], KEY[0], KEY[1], KEY[2], KEY[3], SW[2], SW[3], 
	input [9:0] SW,
	input [3:0] KEY,
	output [8:0] LEDG,
	input CLOCK_50,
	output [6:0] HEX0,
	output [6:0] HEX1,
	output [6:0] HEX3,
	output [9:0] LEDR
	//input [9:0] SW,
	//output [6:0] HEX0
);

//bcd_7seg gabriel(.a(SW), .b(HEX0));
BC_elevador joao(.s(SW[0]), .d(SW[1]), .b1(KEY[3]), .b2(KEY[2]), .b3(KEY[1]), .b4(KEY[0]), .sp(SW[2]),
					  .spe(SW[3]), .b(HEX0), .clock(CLOCK_50), .c(HEX1), .sen1(SW[8]), .sen2(SW[7]), .sen3(SW[6]),
					  .sen4(SW[5]), .e(HEX3), .motor1(LEDR[9]), .motor2(LEDR[8]), .porta(LEDR[0]), .reset(SW[9]),
					  .emerg(SW[4]), .led(LEDG[8:0]));

endmodule