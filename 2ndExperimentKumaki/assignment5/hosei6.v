module 	hosei6( hs1, hs2, hs3, v1, ss, dum );

input hs1, hs2, hs3, v1;
output [2:0] ss;
output dum;
wire d1, d2;

halfadder HA1(hs1, v1, ss[0], d1);
fulladder FA4(hs2, v1, d1, ss[1], d2);
halfadder HA2(d2, hs3, ss[2], dum);


endmodule