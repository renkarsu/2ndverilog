module addandsub(A_DATA, B_DATA, SUB_SEL, RESULT);

input [5:0] A_DATA, B_DATA;
input SUB_SEL;
output [5:0] RESULT;
wire c0, c1, c2, c3, c4, c5;
wire [5:0] bm;

assign bm[0] = B_DATA[0] & ~SUB_SEL | ~B_DATA[0] & SUB_SEL;
assign bm[1] = B_DATA[1] & ~SUB_SEL | ~B_DATA[1] & SUB_SEL;
assign bm[2] = B_DATA[2] & ~SUB_SEL | ~B_DATA[2] & SUB_SEL;
assign bm[3] = B_DATA[3] & ~SUB_SEL | ~B_DATA[3] & SUB_SEL;
assign bm[4] = B_DATA[4] & ~SUB_SEL | ~B_DATA[4] & SUB_SEL;
assign bm[5] = B_DATA[5] & ~SUB_SEL | ~B_DATA[5] & SUB_SEL;

fulladder FA7(A_DATA[0], bm[0], SUB_SEL, RESULT[0], c0);
fulladder FA8(A_DATA[1], bm[1], c0, RESULT[1], c1);
fulladder FA9(A_DATA[2], bm[2], c1, RESULT[2], c2);
fulladder FA10(A_DATA[3], bm[3], c2, RESULT[3], c3);
fulladder FA11(A_DATA[4], bm[4], c3, RESULT[4], c4);
fulladder FA12(A_DATA[5], bm[5], c4, RESULT[5], c5);

endmodule
