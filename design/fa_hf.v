module fa_hf (
    input a,b,c,
    output sum,carry
);
    
wire sum1, carry1, carry2;

half_adder ha1(a,b,sum1,carry1), ha2(c,sum1,sum, carry2);

assign carry= carry1 | carry2;

endmodule