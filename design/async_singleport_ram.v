module async_singleport_ram #(parameter width = 16, depth = 8, addr_size = 3)(
    inout [width-1:0]data, 
    input clk_wr, clk_rd, rst, wr_en,
    input [addr_size-1:0]addr
);
    
reg [width-1:0] ram [depth-1:0]; 
reg [width-1:0] temp_wr, data_out1;

reg [width-1:0] data_out, data_in;

reg [depth-1:0] decode;

assign data = !wr_en? data_out:'bz;


always @(*) begin
    if (wr_en) begin
        data_in = data;
    end
    else begin
        data_in = 'bz;
    end
end


integer i;

///// READ OPERATION:

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
        data_out1= data_out;
    end
    else begin
        temp_wr = ram[addr];
        data_out1= ram[addr];
    end
end


always @(posedge clk_wr) begin
    for (i =0 ;i<depth ;i=i+1 ) begin
        if (rst) begin
            ram[i]<='b0;
        end
        else if (decode[i]) begin
            ram[i]<=temp_wr;
        end
        else ram[i]<=ram[i];
    end
end


always @(*) begin
    case (addr)
       3'b000 :decode= 8'b00000001;
       3'b001 :decode= 8'b00000010;
       3'b010 :decode= 8'b00000100;
       3'b011 :decode= 8'b00001000;
       3'b100 :decode= 8'b00010000;
       3'b101 :decode= 8'b00100000;
       3'b110 :decode= 8'b01000000;
       3'b111 :decode= 8'b10000000;
       
       default: decode= 8'bzzzzzzzz;
    endcase
end

endmodule
