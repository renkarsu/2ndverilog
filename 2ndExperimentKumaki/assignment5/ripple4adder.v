module ripple4adder(A, B, SUM, CRY3);

input [3:0] A, B;
output [3:0] SUM;
output CRY3;

wire CRY0, CRY1, CRY2;

halfadder HA0(.A(A[0]), .B(B[0]), .Y(CRY0), .CO(SUM[0]));
fulladder FA1(.A(A[1]), .B(B[1]), .CIN(CRY0), .SUM(SUM[1]), .COUT(CRY1));
fulladder FA2(.A(A[2]), .B(B[2]), .CIN(CRY1), .SUM(SUM[2]), .COUT(CRY2));
fulladder FA3(.A(A[3]), .B(B[3]), .CIN(CRY2), .SUM(SUM[3]), .COUT(CRY3));

endmodule