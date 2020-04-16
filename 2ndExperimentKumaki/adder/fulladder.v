module fulladder(A, B, CIN, SUM, COUT);

input A, B, CIN;
output SUM, COUT;
wire s1, c1, c2;

halfadder HA1 (.A(A), .B(B), .Y(s1), .CO(c1));
halfadder HA2 (.A(s1), .B(CIN), .Y(SUM), .CO(c2));

assign COUT = c1 | c2;

endmodule

