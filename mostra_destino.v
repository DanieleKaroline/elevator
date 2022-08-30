module mostra_destino (
	input [2:0]de,
	input clock,
	output reg[8:0] e
);

always@(posedge clock)
	begin
		case(de)
			2'b00: e <= 7'b1111001;
			2'b01: e <= 7'b0100100;
			2'b10: e <= 7'b0110000;
			2'b11: e <= 7'b0011001;
		endcase
	end
endmodule
