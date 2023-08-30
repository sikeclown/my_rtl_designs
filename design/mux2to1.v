module mux2to1 (
    input x,y,s, //1 0
    output reg out
);
always @(*) begin
    if(!s)
    begin
     out= x;
    end
else begin
    out= y;
    end
end

endmodule