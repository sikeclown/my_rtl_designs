module tb_priority_encoder_8to3_b ();
    
reg a,b,c,d,e,f,g,h;
wire [2:0] out;

reg[7:0]i;

task initialize;begin
    a=1'b0;
    b=1'b0;
    c=1'b0;
    d=1'b0;
    e=1'b0;
    f=1'b0;
    g=1'b0;
    h=1'b0;
end
endtask

task delay;
    #10;
endtask

task stmulus([7:0]x);begin
    a=x[0];
    b=x[1];
    c=x[2];
    d=x[3];
    e=x[4];
    f=x[5];
    g=x[6];
    h=x[7];
end
endtask

priority_encoder_8to3_b DUT(h,g,f,e,d,c,b,a,out);

initial begin
    initialize;
    for (i =0 ;i<256 ;i=i+1 ) begin
        stmulus(i);
        delay;
    end
end

initial begin
    #1500 $finish;
end

endmodule
