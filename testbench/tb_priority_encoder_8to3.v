module priority_encoder_8to3_tb;

reg [7:0] d_in;
wire[2:0] d_out;
priority_encoder_8to3 dut (d_out, d_in );
initial
begin
d_in=8'b11001100; #10;
d_in=8'b01100110; #10;
d_in=8'b00110011; #10;
d_in=8'b00010010; #10;
d_in=8'b00001001; #10;
d_in=8'b00000100; #10;
d_in=8'b00000011; #10;
d_in=8'b00000001; #10;
d_in=8'b00000000; # 10;
$stop;
end // initial begin
endmodule