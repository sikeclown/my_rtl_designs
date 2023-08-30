module tb_sync_4bit_loadable_up_counter();
reg [3:0] data;
reg clk,rst;
reg load_en;
wire [3:0]q;
reg [5:0]x;

sync_4bit_loadable_up_counter DUT(data, clk,rst,load_en,q);

initial
begin
clk=1'b0;
forever #5 clk=~clk;
end

task stimuli([5:0]y);
begin
{load_en,rst,data}=y;
end
endtask

task delay;
begin
#10;
end
endtask

task initialize;
begin
load_en=1'b0;
rst=1'b1;
data=4'b0000;
end
endtask

initial
begin
initialize;
for(x=0; x<64; x=x+1)
    begin
    stimuli(x);
    delay;
    end
end



endmodule