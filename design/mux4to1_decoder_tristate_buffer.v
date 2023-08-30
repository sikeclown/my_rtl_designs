module mux4to1_decoder_tristate_buffer (
    input i0, i1, i2, i3, [1:0] sel,input  en,
    output out
);

wire [3:0] a;
decoder_2to4 d1(sel[0],sel[1],en,a);
tristate_buffer t0(i0,a[0],out),t1(i1,a[1],out),t2(i2,a[2],out),t3(i3,a[3],out);

endmodule