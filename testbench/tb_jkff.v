module tb_jkff ();
reg j, k, clk, rst;
wire q, qbar;
reg [2:0]x;

jkff DUT(j, k, clk, rst, q, qbar);

task delay;begin
    #15;
end
endtask

task stimuli([2:0]x);begin
    {j,k,rst}=x;
end
endtask

task initialize;begin
    j=1'b0; k=1'b0; rst=1'b0;
end
endtask

initial begin 
    clk=1'b0;
    forever #10 clk<=~clk;
end

initial
begin
    initialize;
    for (x=0; x<=8; x=x+1)begin
    stimuli(x);
    delay;
    end
end
endmodule
