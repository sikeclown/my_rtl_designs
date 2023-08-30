module siso_4bit (
    input din,clk,rst,
    output reg [3:0] dout
);


always@(posedge clk)
begin
if (rst)
dout<=4'b0;
else
dout[0]<=din;
dout[1]<=dout[0];
dout[2]<=dout[1];
dout[3]<=dout[2];
end

endmodule
