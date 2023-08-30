module sync_4bit_up_down_loadable_counter(
    input [3:0] data,
    input clk,rst,load_en,up_down,
    output reg [3:0]q
);

reg [3:0]a;


always@(*)
begin
if(load_en)
a<=data;
else if (up_down)
a<=q+1'b1;
else
a<=q-1'b1;
end

always@(posedge clk)
begin
if(rst)
q<=0;
else
q<=a;
end


endmodule