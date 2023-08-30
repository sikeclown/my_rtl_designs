module tb_mux_4to1_b ();

reg a,b,c,d;
reg [1:0] sel;

wire out;
reg [5:0]i;

task initialize;begin
    a=1'b0;
    b=1'b0;
    c=1'b0;
    d=1'b0;
    sel=2'b00;
end
endtask

task delay;
    #10;
endtask

task stimulus([5:0]x); begin
    a=x[2];
    b=x[3];
    c=x[4];
    d=x[5];
    sel[0]=x[0];
    sel[1]=x[1];
end
endtask

mux_4to1_b DUT(a,b,c,d,sel,out);

initial begin
    initialize;
    for (i= 0 ;i<64 ;i=i+1 ) begin
            stimulus(i);
            delay;
    end
end

initial begin
    #10000 $finish;
end
    
endmodule
