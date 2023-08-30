module async_dualport_ram #(parameter width = 16, depth = 8, addr_size = 3)(
    input [width-1:0]data_in, 
    input clk_wr, clk_rd, rst, wr_en,rd_en,
    input [addr_size-1:0]wr_addr, rd_addr,
    output reg [width-1:0] data_out
);
    
reg [width-1:0] ram [depth-1:0]; 
reg [width-1:0] temp_wr, data_out1;

reg [depth-1:0] out_demux;


integer i;

///// READ OPERATION:


always @(*) begin
    if(rd_en) begin
        data_out1 = ram[rd_addr];
    end
    else begin
        data_out1=data_out;
    end
end

//

always @(posedge clk_rd) begin
    if(rst)begin
        data_out<='b0;
    end
    else data_out<= data_out1;
end

///// WRITE OPERATION:

always @(*) begin
    if (wr_en) begin
        temp_wr= data_in;
    end
    else begin
        temp_wr = ram[wr_addr];
    end
end


always @(posedge clk_wr) begin
    for (i =0 ;i<depth ;i=i+1 ) begin
        if (rst) begin
            ram[i]<='b0;
        end
        else if (out_demux[i]) begin
            ram[i]<=temp_wr;
        end
        else ram[i]<=ram[i];
    end
end


always @(*) begin
    case (wr_addr)
       3'b000 :out_demux= 8'b00000001;
       3'b001 :out_demux= 8'b00000010;
       3'b010 :out_demux= 8'b00000100;
       3'b011 :out_demux= 8'b00001000;
       3'b100 :out_demux= 8'b00010000;
       3'b101 :out_demux= 8'b00100000;
       3'b110 :out_demux= 8'b01000000;
       3'b111 :out_demux= 8'b10000000;
       
       default: out_demux= 8'bzzzzzzzz;
    endcase
end

endmodule
