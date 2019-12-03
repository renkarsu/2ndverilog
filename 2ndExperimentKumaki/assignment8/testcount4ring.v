module testcount4ring;
wire [15:0] out;
reg ck, res;
initial
begin
    $monitor("%t %b %b %b", $time, ck, res, out);
    ck = 1;
    res = 1;
    #40
    res = 0;
    #20
    res = 1;
    #350
    $stop;
end

always #5
begin
    ck <= ~ck;
end

count4ring inst_count4ring(.r_out(out), .clk(clk), .nRST(res));

endmodule