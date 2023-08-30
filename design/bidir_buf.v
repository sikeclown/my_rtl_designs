module bidir_buf (
    inout a, b,
    input sel
);



tristate_buffer t1(a,sel,b), t2(b,!sel,a);
    
endmodule
