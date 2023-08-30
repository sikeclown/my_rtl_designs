module half_adder_tb();

reg a, b;
wire sum, carry;

half_adder DUT(a, b, sum, carry);
initial 
begin
a=1'b0;
b=1'b0;

#5 a=1'b0;
   b=1'b1;

#5 a=1'b1;
   b=1'b0;

#5 a=1'b1;
   b=1'b1;

#50 $finish();

end

endmodule