module tristate_buffer (
    input a,sel,
    output reg out
);

always@(*) begin
    if (sel==0) begin
        out= 1'bz;
    end
    else begin
        out= a;
    end
end
    
endmodule
