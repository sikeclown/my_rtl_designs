module sync_dualport_ram #(parameter width = 8, depth = 16, addr_size = 4)(
    input [width-1:0]data_in, 
    input clk, rst, wr_en,rd_en,
    input [addr_size-1:0]wr_addr, rd_addr,
    output reg [width-1:0] data_out
);
    
reg [width-1:0] ram [depth-1:0]; 
reg [width-1:0] temp_wr, data_out1;

reg [depth-1:0] decode;


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

always @(posedge clk) begin
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


always @(posedge clk) begin
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
    case (wr_addr)
       4'b0000 :decode= 16'b0000000000000001;
       4'b0001 :decode= 16'b0000000000000010;
       4'b0010 :decode= 16'b0000000000000100;
       4'b0011 :decode= 16'b0000000000001000;
       4'b0100 :decode= 16'b0000000000010000;
       4'b0101 :decode= 16'b0000000000100000;
       4'b0110 :decode= 16'b0000000001000000;
       4'b0111 :decode= 16'b0000000010000000;
       4'b1000 :decode= 16'b0000000100000000;
       4'b1001 :decode= 16'b0000001000000000;
       4'b1010 :decode= 16'b0000010000000000;
       4'b1011 :decode= 16'b0000100000000000;
       4'b1100 :decode= 16'b0001000000000000;
       4'b1101 :decode= 16'b0010000000000000;
       4'b1110 :decode= 16'b0100000000000000;
       4'b1111 :decode= 16'b1000000000000000;
       default: decode= 16'bz;
    endcase
end

endmodule
