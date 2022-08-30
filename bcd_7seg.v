module bcd_7seg (
	input [3:0] a,
	output reg[6:0] b
);

always@(*)
	begin
		case(a)
		//0
			4'b0000: begin
							b[0] = 0;
							b[1] = 0;
							b[2] = 0;
							b[3] = 0;
							b[4] = 0;
							b[5] = 0;
							b[6] = 1;
						end
						
		//1
			4'b0001: begin
							b[0] = 1;
							b[1] = 0;
							b[2] = 0;
							b[3] = 1;
							b[4] = 1;
							b[5] = 1;
							b[6] = 1;
						end
						
		//2
			4'b0010: begin
							b[0] = 0;
							b[1] = 0;
							b[2] = 1;
							b[3] = 0;
							b[4] = 0;
							b[5] = 1;
							b[6] = 0;
						end
						
		//3
			4'b0011: begin
							b[0] = 0;
							b[1] = 0;
							b[2] = 0;
							b[3] = 0;
							b[4] = 1;
							b[5] = 1;
							b[6] = 0;
						end
						
		//4
			4'b0100: begin
							b[0] = 1;
							b[1] = 0;
							b[2] = 0;
							b[3] = 1;
							b[4] = 1;
							b[5] = 0;
							b[6] = 0;
						end
						
		//5
			4'b0101: begin
							b[0] = 0;
							b[1] = 1;
							b[2] = 0;
							b[3] = 0;
							b[4] = 1;
							b[5] = 0;
							b[6] = 0;
						end
						
		//6
			4'b0110: begin
							b[0] = 0;
							b[1] = 1;
							b[2] = 0;
							b[3] = 0;
							b[4] = 0;
							b[5] = 0;
							b[6] = 0;
						end
						
		//7
			4'b0111: begin
							b[0] = 0;
							b[1] = 0;
							b[2] = 0;
							b[3] = 1;
							b[4] = 1;
							b[5] = 1;
							b[6] = 1;
						end
						
		//8
			4'b1000: begin
							b[0] = 0;
							b[1] = 0;
							b[2] = 0;
							b[3] = 0;
							b[4] = 0;
							b[5] = 0;
							b[6] = 0;
						end
						
		//9
			4'b1001: begin
							b[0] = 0;
							b[1] = 0;
							b[2] = 0;
							b[3] = 1;
							b[4] = 1;
							b[5] = 0;
							b[6] = 0;
						end
						
		//overflow
			default: begin
							b[0] = 1;
							b[1] = 1;
							b[2] = 1;
							b[3] = 1;
							b[4] = 1;
							b[5] = 1;
							b[6] = 0;
						end
		endcase
	end
	
endmodule
