module tb_siso_4bit ();
reg din,clk;
wire [3:0] dout;

siso_4bit DUT(din, clk, rst, dout);

initial
begin clk=1'b0;
forever #5 clk=~clk;
end

initial
begin
while(1)
begin
#10 din={$random}%2;
end
end
endmodule