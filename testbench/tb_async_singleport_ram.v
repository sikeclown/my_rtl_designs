module tb_async_singleport_ram();reg clk_wr, clk_rd, rst, wr_en;
reg [2:0]addr;reg [15:0]data_w;

wire [15:0]data;
reg data_r;

async_singleport_ram DUT(data, clk_wr, clk_rd, rst, wr_en, addr);

assign data=wr_en?data_w:'bz;

//assign data = !wr_en?data:'bz;

always @(*) begin
    if (!wr_en) begin
        data_r=data;
    end
    else begin
        data_r='bz;
    end
end

initial begin
    clk_wr=1'b0;    forever #2 clk_wr=~clk_wr;
end
initial begin
    clk_rd=1'b0;    forever #5 clk_rd=~clk_rd;
end
initial begin    rst=0;
@(negedge clk_wr) wr_en=1; addr=3'b111; data_w=16'd200;   

@(negedge clk_wr) wr_en=1; addr=3'b110; data_w=16'd50;    
@(negedge clk_wr) wr_en=1; addr=3'b100; data_w=16'd110; 
   
@(negedge clk_wr) wr_en=1; addr=3'b001; data_w=16'd40;
  
@(negedge clk_wr) wr_en=1; addr=3'b010; data_w=16'd60; 
@(negedge clk_wr) wr_en=1; addr=3'b111; data_w=16'd10;    

@(negedge clk_wr) wr_en=1; addr=3'b011; data_w=16'd150; 



@(negedge clk_rd) wr_en=0; addr=3'b111; data_w=16'd100; 
@(negedge clk_rd) wr_en=0; addr=3'b100; data_w=16'd70; 
@(negedge clk_rd) wr_en=0; addr=3'b100; data_w=16'd200; 
@(negedge clk_rd) wr_en=0; addr=3'b010; data_w=16'd40;
@(negedge clk_rd) wr_en=0; addr=3'b111; data_w=16'd20;    
@(negedge clk_rd) wr_en=0; addr=3'b011; data_w=16'd200; 
end
endmodule
