module tb_tff_dff();

reg t, clk, rst;
wire q, qbar;

tff_dff DUT(t, clk, rst, q, qbar);

initial
begin
clk=1'b0;
forever #10 clk=~clk;
end

initial
begin
t=1'b1; rst=1'b1;
#20 t=1'b1; rst=1'b0;
#10 
#20 t=1'b0; rst=1'b0;
#10 t=1'b1; rst=1'b1;
#30 t=1'b0; rst=1'b0;
end


endmodule