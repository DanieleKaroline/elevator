module display7segm(
	input [9:0] a,
	output [6:0] b
);

assign b[6:0] = a[6:0];

endmodule