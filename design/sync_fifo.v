module sync_fifo #(parameter width=8, depth=16, addr_size=4)(
    input [width-1:0] data_in,
    input rst, clk, rd_en, wr_en, 
    output fifo_full, fifo_empty,
    output [width-1:0] data_out
);
    
reg [addr_size:0] rd_ptr, wr_ptr;

reg [addr_size:0] rd,wr;
wire f,e;

assign fifo_full = {wr_ptr[addr_size], wr_ptr[addr_size-1:0]} == {~rd_ptr[addr_size], rd_ptr[addr_size-1:0]} ? 'b1 : 'b0;
assign fifo_empty = (wr_ptr == rd_ptr)?'b1:'b0;

assign f = fifo_full;
//assign e = (wr_ptr  == rd_ptr)? 'b1:'b0;
assign e = fifo_empty;




// READ SIDE
always @(*) begin
    if (rd_en && !e) begin
        rd=rd_ptr+'d1;
    end
    else begin
        rd=rd_ptr;
    end
end

always @(posedge clk) begin
    if (rst) begin
        rd_ptr<='b0;
    end
    else begin
        rd_ptr<=rd;
    end
end

sync_dualport_ram r1(data_in, clk, rst, wr_en && !f, rd_en && !e, wr_ptr[addr_size-1:0], rd_ptr[addr_size-1:0], data_out);

//WRITE SIDE
always @(*) begin
    if (wr_en && !f) begin
        wr=wr_ptr+'d1;
    end
    else begin
        wr=wr_ptr;
    end
end

always @(posedge clk) begin
    if (rst) begin
        wr_ptr<='b0;
    end
    else begin
        wr_ptr<=wr;
    end
end

endmodule
