module tb_sr_latch();
reg s,r;
wire q,qbar;
reg [1:0]x;

task stimuli([1:0]x);
begin
{s,r}=x;
end
endtask

task delay;
begin
    #10;
end
endtask

task initialize();
begin
s=1'b0;
r=1'b0;
end
endtask

sr_latch DUT (s,r,q,qbar);

initial
begin
    initialize();
    for (x=0; x<4; x=x+1)
    begin
        stimuli(x);
        delay;
    end
end

endmodule
