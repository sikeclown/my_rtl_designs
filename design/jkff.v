module jkff (
    input j, k, clk, rst, 
    output reg q, qbar
    );


parameter HOLD = 2'b00, SET = 2'b10, RESET = 2'b01, TOGGLE = 2'b11;
reg q1, q1bar;

always@(*)
begin
    case({j,k})
    HOLD: q1=q;
    RESET: q1=1'b0;
    SET: q1=1'b1;
    TOGGLE: q1=qbar;
    default: q1=1'bz;
    endcase 
    q1bar=~q1;
end

always@(posedge clk)
begin
    if(rst)begin
    q<=1'b0;
    qbar<=1'b1;
    end
    
    else begin
    q<=q1;
    qbar<=q1bar;
    end
end

endmodule 
