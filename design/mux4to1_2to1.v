module mux4to1_2to1 (
    input a, input b, input c, input d, input [1:0]sel, //00 01 10 11
    output out
);
    
wire out1,out2;
mux2to1 m1(a,b,sel[0],out1), m2(c,d,sel[0],out2), m3(out1,out2,sel[1],out);


endmodule