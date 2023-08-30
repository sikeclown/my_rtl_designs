module async_singleport_ram #(parameter width = 16, depth = 8, addr_size = 3)(
    inout [width-1:0]data_inout, 
    input clk_wr, clk_rd, rst, wr_en,
    input [addr_size-1:0]addr
    
);
    
reg [width-1:0] ram [depth-1:0]; 
reg [width-1:0] temp_wr, data_out1;

reg [depth-1:0] out_demux;

reg data;
integer i;

assign data_inout =wr_en ? 'bz : data;

///// READ OPERATION:


/*always @(*) begin
    if(!wr_en) begin
        data_out1 = ram[addr];
    end
    else begin
        data_out1=data;
    end
end
*/
//

always @(posedge clk_rd) begin
    if(rst)begin
        data<='b0;
    end
    else data<= data_out1;
end

///// WRITE OPERATION:

always @(*) begin
    if (wr_en) begin
        temp_wr= data_inout;
        data_out1=data;
    end
    else begin
        data_out1 = ram[addr];
        temp_wr= ram[addr];
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
    case (addr)
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
