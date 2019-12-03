module mult8(clk, nRST, c_ALL, m_busy, a_data, b_data, mult_out, m_finish);

input clk;
input nRST;
input c_ALL;
input m_busy;
input [7:0] a_data;
input [7:0] b_data; 
output m_finish;
reg m_finish;
output [15:0] mult_out;
reg [15:0] mult_out;
reg [3:0] Lcounter;
reg [16:0] S_reg;
reg [1:0] b_mode;
reg  update;

parameter [1:0] M_idle = 2'b00;
parameter [1:0] M_go = 2'b01;
parameter [1:0] M_busy = 2'b10;
parameter [1:0] M_finish = 2'b11;

always @(posedge clk or negedge nRST)
begin
    if(nRST == 1'b0)
    begin
        S_reg [16:0] <= 17'b0;
        m_finish <= 1'b0;
        mult_out[15:0] <= 16'b0;
    end
    else if(c_ALL == 1'b1) 
    begin
        S_reg[16:0] <= 17'b0;
        m_finish <= 1'b0;
        mult_out[15:0] <= 16'b0;
    end
    else
    begin
        case(b_mode)
            M_idle: 
            if(m_busy == 1'b0)
            begin
                m_finish <= 1'b0;
                mult_out[15:0] <= 16'b0;
                Lcounter <= 4'b1000;
                b_mode <= M_go;
            end
            M_go:
            begin
                S_reg[16:9] <= 8'b0;
                S_reg[8:1] <= b_data[7:0];
                S_reg[0] <= 1'b0;
                update <= 1'b0;
                b_mode <= M_busy;
            end
            M_busy: 
            begin
                if(Lcounter == 4'b0000)
                    b_mode <= M_finish;
                else
                begin
                    if(update == 1'b0)
                        begin
                        case({S_reg[1], S_reg[0]})
                            2'b00:
                            begin
                                update <= 1'b1;
                            end
                            2'b11:
                            begin
                                update <= 1'b1;
                            end
                            2'b01:
                            begin
                                S_reg[16:9] <= S_reg[16:9] + a_data;
                                update <= 1'b1;
                            end
                            2'b10:
                            begin
                                S_reg[16:9] <= S_reg[16:9] + (~a_data + 1'b1);
                                update <= 1'b1;
                            end
                        endcase
                        end
                    else
                    begin
                        S_reg <= {S_reg[16] , S_reg[16:1]};
                        Lcounter <= Lcounter - 1'b1;
                        update <= 1'b0;
                    end
                end
            end
            M_finish:
            begin
                mult_out <= S_reg[16:1];
                m_finish <= 1'b1;
                b_mode <= M_idle;
            end
            default: b_mode <= M_idle;
        endcase
    end
end
endmodule