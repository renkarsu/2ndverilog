module test_mult8;

reg CLOCK, NRST;
reg CLEAR;
reg FIRE;
reg [7:0] X, Y;
wire [15:0] Z;
wire FINISH;

mult8 ins_mult8(.clk(CLOCK), .nRST(NRST), .c_ALL(CLEAR), .m_busy(FIRE), .a_data(X), .b_data(Y), .mult_out(Z), .m_finish(FINISH));

always #5 CLOCK = ~CLOCK;
initial
begin
    NRST  = 1'b1;
    CLOCK = 1'b1;
    CLEAR = 1'b0;
    FIRE  = 1'b0;
    #20 NRST = 1'b0;
    #20 NRST = 1'b1;
    // 9 × 5 = 45
    #20 CLEAR = 1'b1;
    #20 CLEAR = 1'b0;
    #20 X = 8'b0000_1001; Y = 8'b0000_0101;
    #10 FIRE  = 1'b1;
    #20 FIRE  = 1'b0;
    #600
    // 7 × -5 = -35
    #20 CLEAR = 1'b1;
    #20 CLEAR = 1'b0;
    #20 X = 8'b0000_0111; Y = 8'b1111_1011;
    #10 FIRE  = 1'b1;
    #20 FIRE  = 1'b0;
    #600
    // 50 × 3 = 150
    #20 CLEAR = 1'b1;
    #20 CLEAR = 1'b0;
    #20 X = 8'b0011_0010; Y = 8'b0000_0011;
    #10 FIRE  = 1'b1;
    #20 FIRE  = 1'b0;
    #600
    // 12 × 40 = 480
    #20 CLEAR = 1'b1;
    #20 CLEAR = 1'b0;
    #20 X = 8'b0000_1100; Y = 8'b0010_1000;
    #10 FIRE  = 1'b1;
    #20 FIRE  = 1'b1;
    #600
    // -14 × 20 = -280
    #20 CLEAR = 1'b1;
    #20 CLEAR = 1'b0;
    #20 X = 8'b1111_0010; Y = 8'b0001_0100;
    #10 FIRE  = 1'b1;
    #20 FIRE  = 1'b0;
    #600
    // 33 × -100 = -3300
    #20 CLEAR = 1'b1;
    #20 CLEAR = 1'b0;
    #20 X = 8'b0010_0001; Y = 8'b1001_1100;
    #10 FIRE  = 1'b1;
    #20 FIRE  = 1'b0;
    #600
    // -5 × -14 = 70
    #20 CLEAR = 1'b1;
    #20 CLEAR = 1'b0;
    #20 X = 8'b1111_1011; Y = 8'b1111_0010;
    #10 FIRE  = 1'b1;
    #20 FIRE  = 1'b0;
    #600
    #200 $finish;
end

initial
    $monitor("%t CLOCK%b NRST%b CLEAR%b FIRE%b X%b Y%b Z%b FINISH%b", $time, CLOCK, NRST, CLEAR, FIRE, X, Y, Z, FINISH);
endmodule