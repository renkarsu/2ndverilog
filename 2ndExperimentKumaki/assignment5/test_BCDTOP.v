module test_BCDTOP;

reg	[3:0] X, Y;
wire [3:0] S;
wire CARRY, dummy;

BCDTOP BCDTOP1(X, Y, S, CARRY, dummy);

initial
begin
        X = 4'h0 ; Y = 4'h0 ;
    #50	X = 4'h3 ; Y = 4'h5 ;
    #50	X = 4'h4 ; Y = 4'h6 ;
    #50	X = 4'h9 ; Y = 4'h9 ;
    #50	X = 4'h7 ; Y = 4'h6 ;
    #50	X = 4'h1 ; Y = 4'h8 ;
    #50	$finish ;
end

initial $monitor ("%t %b %b %b %b", $time, X, Y, S, CARRY);
endmodule