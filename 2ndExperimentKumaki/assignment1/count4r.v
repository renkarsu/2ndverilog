module count4r(out, ck, res);

output [3:0] out;
input ck, res;
reg[3:0] q;

always @( posedge ck or negedge res)
    begin
        if (!res)
        begin
            q <= 0;
        end

        else
        begin
            q <= q + 1;
        end
    end

assign out = q;

endmodule
