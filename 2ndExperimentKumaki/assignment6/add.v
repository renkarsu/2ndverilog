module add(A_DATA, B_DATA, SUM_DATA);

input [3:0] A_DATA, B_DATA;
output [5:0] SUM_DATA;
wire c0, c1, c2, c3;

halfadder HA10(A_DATA[0], B_DATA[0], SUM_DATA[0], c0);
fulladder FA4(A_DATA[1], B_DATA[1], c0, SUM_DATA[1], c1);
fulladder FA5(A_DATA[2], B_DATA[2], c1, SUM_DATA[2], c2);
fulladder FA6(A_DATA[3], B_DATA[3], c2, SUM_DATA[3], c3);

assign SUM_DATA[4] = c3;
assign SUM_DATA[5] = 0;

endmodule


