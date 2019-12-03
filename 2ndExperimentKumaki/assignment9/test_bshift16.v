module test_bshift16;

reg CLK, NRST, PRESET, DIR;
reg SHIFT_GO;
reg [15:0] S_INDATA;
reg [3:0] S_NUM;
wire [15:0] SH_DATA;
wire SH_FINISH;

bshift16 inst_bshift16(.clk(CLK), .nRST(NRST), .preset(PRESET), .dir(DIR), .s_num(S_NUM),
                       .shift_go(SHIFT_GO), .s_indata(S_INDATA), .s_out(SH_DATA), .s_finish(SH_FINISH));

always #5
begin
    CLK = ~CLK;
end

initial
    begin
        CLK = 1'b1;
        NRST = 1'b1;
        PRESET = 1'b0;
        SHIFT_GO = 1'b0;
        #20 NRST = 1'b0;
        #20 NRST = 1'b1;
        #30
        S_INDATA = 16'b0101_1001_1011_0101;
        S_NUM = 4'b0111;
        DIR = 1'b0;
        #20 PRESET = 1'b1;
        #20 PRESET = 1'b0;
        #10 SHIFT_GO = 1'b1;
        #20 SHIFT_GO = 1'b0;
        #100 NRST = 1'b0;
        #20 NRST = 1'b1;
        #30
        S_INDATA = 16'b1101_0100_1100_0110;
        S_NUM = 4'b0100;
        DIR = 1'b1;
        #20 PRESET = 1'b1;
        #20 PRESET = 1'b0;
        #10 SHIFT_GO = 1'b1;
        #20 SHIFT_GO = 1'b0;
        #100 $stop;
    end
endmodule