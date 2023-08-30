module sr_latch(
    input s,r,
    output q,qbar);


nor N1(q,r,qbar);
nor N2(qbar,s,q);

endmodule
