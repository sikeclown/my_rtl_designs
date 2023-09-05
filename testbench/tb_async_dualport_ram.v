module tb_async_dualport_ram();
reg clk_rd, clk_wr, rst, wr_en, rd_en;
reg [2:0]wr_addr, rd_addr;
reg [15:0]data_in;
wire [15:0]data_out;

async_dualport_ram DUT(data_in, clk_wr, clk_rd, rst, wr_en, rd_en, wr_addr, rd_addr, data_out);

initial
begin
    clk_wr=1'b0;
    forever #5 clk_wr=~clk_wr;
end
initial begin
    clk_rd=1'b0;
    forever #7 clk_rd=~clk_rd;
end

initial begin
    rst=0;
    wr_en=1; rd_en=1'b0; wr_addr=3'b101; rd_addr=3'b100; data_in=16'd200; 
    #14 wr_en=0; rd_en=1'b1; wr_addr=3'b100; rd_addr=3'b101; data_in=16'd100;
    #10 wr_en=1; rd_en=1'b0; wr_addr=3'b110; rd_addr=3'b010; data_in=16'd140;
    #10 wr_en=1; rd_en=1'b0; wr_addr=3'b001; rd_addr=3'b110; data_in=16'd50;
    #14 wr_en=1; rd_en=1'b1; wr_addr=3'b001; rd_addr=3'b001; data_in=16'd70;
    #10 wr_en=1; rd_en=1'b0; wr_addr=3'b000; rd_addr=3'b001; data_in=16'd30;
    #14 wr_en=0; rd_en=1'b1; wr_addr=3'b100; rd_addr=3'b000; data_in=16'd20;
    #10 wr_en=1; rd_en=1'b0; wr_addr=3'b000; rd_addr=3'b001; data_in=16'd10;
    #10 wr_en=1; rd_en=1'b0; wr_addr=3'b110; rd_addr=3'b110; data_in=16'd15;
    #14 wr_en=0; rd_en=1'b1; wr_addr=3'b000; rd_addr=3'b000; data_in=16'd40;
    #10 wr_en=1; rd_en=1'b0; wr_addr=3'b111; rd_addr=3'b001; data_in=16'd60;
    #10 wr_en=1; rd_en=1'b0; wr_addr=3'b011; rd_addr=3'b110; data_in=16'd80;
    #14 wr_en=0; rd_en=1'b1; wr_addr=3'b000; rd_addr=3'b011; data_in=16'd40;
    #14 wr_en=0; rd_en=1'b1; wr_addr=3'b000; rd_addr=3'b111; data_in=16'd130;
    #10 rst=1;
end
endmodule
