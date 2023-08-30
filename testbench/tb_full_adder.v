module full_adder_tb();

reg a, b, c;
wire sum, carry_out;

full_adder DUT(a, b, c, sum, carry_out);
initial 
begin
a=1'b0;
b=1'b0;
c=1'b0;

#50 a=1'b0;
   b=1'b0;
   c=1'b1;

#50 a=1'b0;
   b=1'b1;
   c=1'b0;

#50 a=1'b0;
   b=1'b1;
   c=1'b1;

#50 a=1'b1;
   b=1'b0;
   c=1'b0;

#50 a=1'b1;
   b=1'b0;
   c=1'b1;

#50 a=1'b1;
   b=1'b1;
   c=1'b0;

#50 a=1'b1;
   b=1'b1;
   c=1'b1;

 $display("a=%b, b=%b, c=%b, sum=%b, carry_out=%b", a, b, c, sum, carry_out);


end

endmodule
