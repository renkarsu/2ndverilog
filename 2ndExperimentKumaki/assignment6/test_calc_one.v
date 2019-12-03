module test_calc_one;

reg CLK;
reg RST_X;
reg [13:0] PSW;
wire [7:0] SEG_1_OUT;
wire [3:0] SEG_SEL_1;
wire [7:0] SEG_2_OUT;
wire [3:0] SEG_SEL_2;

calc_one_top calc_one_top1(CLK, RST_X, PSW, SEG_1_OUT, SEG_SEL_1, SEG_2_OUT, SEG_SEL_2);

always#5 CLK = ~CLK;
initial
begin
    RST_X <= 0;
    CLK <= 1;
    PSW <= 14'b11_1111_1111_1111;
    #50 RST_X <= 1;
    //test of 1+2=3 SEG_C="1"60, SEG_E="2"da, SEG_G=" "00, SEG_H="3"f2
    #50  PSW <= 14'b11_1111_1111_1101;
    #100 PSW <= 14'b01_1111_1111_1111;
    #100 PSW <= 14'b11_1111_1111_1011;
    #100 PSW <= 14'b11_1011_1111_1111;
    //test of 5-9=-4 SEG_C="5"b6, SEG_E="9"f6, SEG_G="-"02, SEG_H="4"66
    #500 PSW <= 14'b11_1111_1101_1111;
    #100 PSW <= 14'b10_1111_1111_1111;
    #100 PSW <= 14'b11_1101_1111_1111;
    #100 PSW <= 14'b11_1011_1111_1111;
    //test of 9+8=17 SEG_C="9"f6, SEG_E="8"fe, SEG_G="1"60, SEG_H="7"e0
    #500 PSW <= 14'b11_1101_1111_1111;
    #100 PSW <= 14'b01_1111_1111_1111;
    #100 PSW <= 14'b11_1110_1111_1111;
    #100 PSW <= 14'b11_1011_1111_1111;
    //test of 1+2=3 SEG_C="6"be, SEG_E="6"be, SEG_G=" "00, SEG_H="0"fc
    #500 PSW <= 14'b11_1111_1011_1111;
    #100 PSW <= 14'b10_1111_1111_1111;
    #100 PSW <= 14'b11_1111_1011_1111;
    #100 PSW <= 14'b11_1011_1111_1111;
    #500 $finish;
end
endmodule




