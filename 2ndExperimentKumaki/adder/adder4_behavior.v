module adder4_behavior(a, b, sum);

input [3:0] a, b;
output [4:0] sum;

assign sum = a + b;

endmodule