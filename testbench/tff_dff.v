module tff_dff(
    input t, clk, rst,
    output q, qbar
);
    
reg d;

always @(*) begin
    d=t^q;
end

dff d1(d,clk,rst,q,qbar);



endmodule
