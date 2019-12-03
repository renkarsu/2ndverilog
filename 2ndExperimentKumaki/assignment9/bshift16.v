module bshift16(clk, nRST, preset, shift_go, dir, s_num, s_indata, s_out, s_finish);

input clk, nRST, preset, shift_go, dir;
input [3:0] s_num;
input [15:0] s_indata;
output s_finish;
reg s_finish;
reg [15:0] shift_reg;
reg [3:0] count;
reg s_busy;

always @(posedge shift_go)
begin
    s_busy <= 1'b1;
end

always @(posedge clk or negedge nRST)
begin
    if(nRST == 1'b0)
    begin
        shift_reg <= 16'b0000_0000_0000_0000;
        count <= 4'b0000;
        s_finish <= 1'b0;
        s_busy <= 1'b0;
    end
    else
    begin
        if(preset == 1'b1)
            begin
                shift_reg <= s_indata;
                count <= s_num;
            end
        else
        begin
            if((s_busy == 1'b1) & (count >= 1))
                begin
                    shift_reg <= (dir == 1'b0) ? shift_reg << 1 : shift_reg >> 1;
                    count <= count - 1;
                end
            else
                if((s_busy == 1'b1) & (count == 0))
                    begin
                        s_finish <= 1'b1;
                        s_busy <= 1'b0;
                    end
        end
    end
end

assign	s_out = shift_reg;

endmodule










