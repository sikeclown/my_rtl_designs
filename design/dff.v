module dff (
    input d,clk,rst,
    output reg q, qbar
);
    
reg q1,q1bar;

always @(*) begin
    q1=d;
    q1bar=~q1;

end

always @(posedge clk) begin
    if (rst) begin
        q<=1'b0;
        qbar<=1'b1;
    end
    else begin
        q<=q1;
        qbar<=~q1;
    end
end

endmodule   