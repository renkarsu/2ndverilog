module sub(A_DATA, B_DATA, SUB_DATA);

input [3:0] A_DATA;
input [3:0] B_DATA;
output [5:0 SUB_DATA;
wire c0, c1, c2, c3, c4, c5;
wire d0, d1, d2, d3, d4, d5;
wire [3:0] binv;
wire [5:0] bm;

assign binv = ~B_DATA;

halfadder HA1 (1'b1, binv[0], bm[0], c0);
halfadder HA2 (c0, binv[1], bm[1], c1);
halfadder HA3 (c1, binv[2], bm[2], c2);
halfadder HA4 (c2, binv[3], bm[3], c3);
halfadder HA5 (c3, 1'b1, bm[4], c4);
halfadder HA6 (c4, 1'b1, bm[5], c5);
halfadder HA7 (A_DATA[0], bm[0], SUB_DATA[0], d0);
halfadder HA8 (bm[4], d3, SUB_DATA[4], d4);
halfadder HA9 (bm[5], d4, SUB_DATA[5], d5);
fulladder FA1 (A_DATA[1], bm[1], d0, SUB_DATA[1], d1);
fulladder FA2 (A_DATA[2], bm[2], d1, SUB_DATA[2], d2);
fulladder FA3 (A_DATA[3], bm[3], d2, SUB_DATA[3], d3);

endmodule