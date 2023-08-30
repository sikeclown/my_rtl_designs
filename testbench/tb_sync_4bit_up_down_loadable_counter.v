module tb_sync_4bit_up_down_loadable_counter();
reg [3:0] data;
reg clk,rst;
reg load_en;
reg up_down;
wire [3:0]q;
reg [6:0]x;

sync_4bit_up_down_loadable_counter DUT(data,clk,rst,load_en,up_down,q);

initial
begin
clk=1'b0;
forever #5 clk=~clk;
end

task stimuli();
begin
{load_en,rst,up_down,data}=x;
end
endtask

task delay();
begin
#10;
end
endtask

task initialize();
begin
load_en=1'b0;
rst=1'b0;
data=4'b0000;
up_down=1'b0;
end
endtask



initial
begin
initialize();
for(x=0; x<128; x=x+1)
    begin 
    stimuli();
    delay();
    end
end

endmodule