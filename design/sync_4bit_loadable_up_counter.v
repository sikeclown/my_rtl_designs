module sync_4bit_loadable_up_counter (
    input [3:0] data,input clk,rst,load_en,
    output reg [3:0] q
);

reg [3:0]a;

always @(*) begin
if (load_en) begin
    a=data;
end
else begin
    a=q+4'b1;
end
end

always @(posedge clk) begin
    if (rst) begin
        q<=4'b0;
    end
    else begin
        q<=a;
    end
end

endmodule