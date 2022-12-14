module mostra_andar(
	input sen1, sen2, sen3, sen4, clock,
	output reg[6:0] a
);

always@(posedge clock)
	begin
		if(sen1) a <= 7'b1111001;
		else if(sen2) a <= 7'b0100100;
		else if(sen3) a <= 7'b0110000;
		else if(sen4) a <= 7'b0011001;
	end
endmodule
