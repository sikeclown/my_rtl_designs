module tb_sync_dualport_ram #(parameter width = 8, depth = 16, addr_size = 4) ();
reg clk, rst, wr_en, rd_en;
reg [addr_size-1:0]wr_addr, rd_addr;
reg [width-1:0]data_in;
wire [width-1:0]data_out;

sync_dualport_ram DUT(data_in, clk, rst, wr_en, rd_en, wr_addr, rd_addr, data_out);

initial
begin
    clk=1'b0;
    forever #5 clk=~clk;
end


initial begin
    rst='b0;
    wr_en=1; rd_en=1'b0; wr_addr=4'b1101; rd_addr=4'b1100; data_in=8'd200;
    #10 wr_en=1'b0; rd_en=1'b1; wr_addr=4'b1101; rd_addr=4'b1101; data_in=8'd100;
    #10 wr_en=1'b1; rd_en=1'b0; wr_addr=4'b0110; rd_addr=4'b0010; data_in=8'd140;
    #10 wr_en=1'b1; rd_en=1'b1; wr_addr=4'b1001; rd_addr=4'b1101; data_in=8'd50;
    #10 wr_en=1'b0; rd_en=1'b1; wr_addr=4'b0001; rd_addr=4'b1001; data_in=8'd70;
    #10 wr_en=1'b0; rd_en=1'b0; wr_addr=4'b1001; rd_addr=4'b0001; data_in=8'd30;
    #10 wr_en=1'b0; rd_en=1'b1; wr_addr=4'b0100; rd_addr=4'b1011; data_in=8'd20;
    #10 wr_en=1'b1; rd_en=1'b1; wr_addr=4'b0000; rd_addr=4'b1001; data_in=8'd10;
    #10 wr_en=1'b0; rd_en=1'b1; wr_addr=4'b0110; rd_addr=4'b0110; data_in=8'd10;
    #10 wr_en=1'b0; rd_en=1'b1; wr_addr=4'b0000; rd_addr=4'b0000; data_in=8'd40;

end

endmodule
