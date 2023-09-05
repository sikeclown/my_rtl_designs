
module tb_sync_fifo ();
reg clk, rst, rd_en, wr_en;
reg [7:0] data_in;
wire [7:0] data_out;
wire fifo_empty;
wire fifo_full;
integer i;

sync_fifo DUT(data_in, rst, clk, rd_en, wr_en, fifo_full, fifo_empty, data_out);

initial
begin
    clk=1'b0;
forever #5 clk = ~clk;
end

initial
begin
rst = 1'b0;
wr_en = 1'b0;
rd_en = 1'b0;
data_in = 8'b0;
#10 rst=1'b1;

//write_data
#20 rst=1'b0;wr_en=1'b1; rd_en=1'b0;
for (i = 0; i < 20; i = i + 1)
begin
@(negedge clk) data_in=i;
end


#20
//read_data
@(negedge clk) rst=1'b0;wr_en=1'b0; rd_en=1'b1;
#70


//write_data and read_data



rst=1'b0;wr_en=1'b1; rd_en=1'b0;
for (i = 30; i < 60; i = i + 1)
begin

@(negedge clk) data_in=i;
end

@(negedge clk) rst=1'b0;wr_en=1'b1; rd_en=1'b1;
#70;




end




endmodule
