module mux4to1_2to1_tb();

reg [1:0]sel;
reg a,b,c,d;
wire o;

mux4to1_2to1 DUT(a,b,c,d, sel, o);
initial 
begin
sel=2'b01; a=1'b1; b=1'b1; c=1'b0; d=1'b0;

#50 sel=2'b10; a=1'b0; b=1'b0; c=1'b0; d=1'b1;

#50 sel=2'b00; a=1'b0; b=1'b0; c=1'b0; d=1'b1;

#50 sel=2'b11; a=1'b0; b=1'b0; c=1'b0; d=1'b1;

#50 sel=2'b10; a=1'b0; b=1'b0; c=1'b0; d=1'b1;


end

endmodule