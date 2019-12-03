module calc_one_top(CLK, RST_X, PSW, SEG_1_OUT, SEG_SEL_1, SEG_2_OUT, SEG_SEL_2);

input CLK;
input RST_X;
input [13:0] PSW;
output [7:0] SEG_1_OUT;
output [3:0] SEG_SEL_1;
output [7:0] SEG_2_OUT;
output [3:0] SEG_SEL_2;
wire [3:0] a_data;
wire [3:0] b_data;
wire [5:0] sub_data;
wire [5:0] sum_data;

controller controller_ins(.CLK(CLK), .RST_X(RST_X), .PSW(PSW), .SUM_DATA(sum_data),
                          .SUB_DATA(sub_data), .A_DATA(a_data), .B_DATA(b_data),
                          .SEG_1_OUT(SEG_1_OUT), .SEG_SEL_1(SEG_SEL_1),
                          .SEG_2_OUT(SEG_2_OUT), .SEG_SEL_2(SEG_SEL_2));
add add_ins(a_data, b_data, sum_data);
sub sub_ins(a_data, b_data, sub_data);

endmodule