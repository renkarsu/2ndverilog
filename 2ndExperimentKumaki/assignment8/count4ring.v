module count4ring(r_out, clk, nRST);
input clk, nRST;
output [15:0] r_out;
reg [3:0] q;
always @(posedge clk or negedge nRST)
begin
    if(nRST == 1'b0)
    begin
        q <= 4'b0;
    end
    else
    begin
        q <= q + 4'h1;
    end
end

assign r_out = ring(q);

function [15:0] ring;
    input [3:0] q_in;

    case(q_in)
        4'b0000 : ring = 16'b0000000000000001;
        4'b0001 : ring = 16'b0000000000000010;
        4'b0010 : ring = 16'b0000000000000100;
        4'b0011 : ring = 16'b0000000000001000;
        4'b0100 : ring = 16'b0000000000010000;
        4'b0101 : ring = 16'b0000000000100000;
        4'b0110 : ring = 16'b0000000001000000;
        4'b0111 : ring = 16'b0000000010000000;
        4'b1000 : ring = 16'b0000000100000000;
        4'b1001 : ring = 16'b0000001000000000;
        4'b1010 : ring = 16'b0000010000000000;
        4'b1011 : ring = 16'b0000100000000000;
        4'b1100 : ring = 16'b0001000000000000;
        4'b1101 : ring = 16'b0010000000000000;
        4'b1110 : ring = 16'b0100000000000000;
        4'b1111 : ring = 16'b1000000000000000;
        default : ring = 16'b1111111111111111;
    endcase

endfunction

endmodule