module mux4to1_decoder_tristate_buffer_tb();

reg [1:0]sel;
reg i0,i1,i2,i3,en;
wire out;

mux4to1_decoder_tristate_buffer DUT(i0,i1,i2,i3, sel, en, out);

initial 
begin
sel=2'b01; i0=1'b0; i1=1'b1; i2=1'b0; i3=1'b1; en =1'b1;

#50 sel=2'b10; i0=1'b1; i1=1'b1; i2=1'b1; i3=1'b1;

#50 sel=2'b00; i0=1'b0; i1=1'b0; i2=1'b0; i3=1'b1;

#50 sel=2'b11; i0=1'b0; i1=1'b1; i2=1'b0; i3=1'b0;

#50 sel=2'b10; i0=1'b1; i1=1'b1; i2=1'b1; i3=1'b1;en =1'b0;

#50 sel=2'b11; i0=1'b0; i1=1'b1; i2=1'b0; i3=1'b0;


end

endmodule
