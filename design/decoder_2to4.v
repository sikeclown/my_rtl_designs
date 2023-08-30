module decoder_2to4 (
    input a,b,en,
    output [3:0] out
);
assign out[0] =(en & ~a & ~b);
assign out[1] =(en & ~a & b);
assign out[2] =(en & a & ~b);
assign out[3] =(en & a & b);

endmodule
