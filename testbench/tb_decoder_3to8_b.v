module tb_decoder_3to8_b();

reg a,b,c;
wire [7:0] out;
reg [2:0]i;

task stmulus([2:0]x);begin
    {a,b,c} =x;
end
endtask

task initialize;begin
   a=1'b0;
   b=1'b0 ;
   c=1'b0 ;
end
endtask

task delay;
    #10;
endtask
    
decoder_3to8_b DUT(a,b,c,out);

initial begin
    initialize;
    delay;
    for (i=0; i<8; i=i+1) begin
        stmulus(i);
        delay;
    end
end

initial begin
    #90 $finish;
end
endmodule