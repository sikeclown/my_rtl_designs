module ripple_carry_4b(
    input [3:0]a,b,
    input cin,
    output reg [3:0] sum,
    output reg carry
);
  
wire s1,c1,s2,c2,s3,c3,s4,c4;

full_adder f1(a[0],b[0],cin,s1,c1), f2(a[1],b[1],c1,s2,c2), f3(a[2],b[2],c2,s3,c3), f4(a[3],b[3],c3,s4,c4);

always@(*) begin
    sum = {s4,s3,s2,s1};
    carry = c4;
end




endmodule
