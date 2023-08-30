module ripple_carry_adder_tb();

reg [3:0] a,b;
reg c;

wire [3:0] sum;
wire carry_out;

ripple_carry_4b DUT(a,b,c,sum,carry_out);

initial 
begin

a=4'b0101; b=4'b1010; c=1'b1;
#50 a=4'b1010; b=4'b1010; c=1'b1;
#50 a=4'b0101; b=4'b1111; c=1'b0;
#50 a=4'b1101; b=4'b1010; c=1'b0;
#50 a=4'b0001; b=4'b1011; c=1'b1;
#50 a=4'b1111; b=4'b1111; c=1'b1;


end

endmodule
