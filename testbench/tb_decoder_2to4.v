module decoder_2to4_tb();

reg a,b,en;

decoder_2to4 DUT(a,b,en, out);
initial 
begin

{a,b}=2'b00; en=1'b1;
#50 {a,b}=2'b10;en=1'b1;
#50 {a,b}=2'b11;en=1'b1;
#50 {a,b}=2'b01;en=1'b1;

#50 {a,b}=2'b11;en=1'b0;
#50 {a,b}=2'b00; en=1'b0;

end

endmodule
