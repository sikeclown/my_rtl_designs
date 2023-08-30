module bidir_buf_tb ();

reg a, b, sel;
wire a1, b1;



bidir_buf DUT (a1,b1,sel); 

assign a1=sel?a:1'bz;
assign b1=~sel?b:1'bz;

initial begin


    a=1'b1; b=1'b0;  sel= 1'b1;
    #50 a=1'b1; b=1'b0; sel= 1'b0;
    #50 a=1'b1; b=1'b1; sel= 1'b1;
    #50 a=1'b0; b=1'b0; sel= 1'b0;


end
initial $monitor("a1=%b,b1=%b,sel=%b",a1,b1,sel);
endmodule

/*

module bidir_buf_tb();
wire a,b;
reg ctrl;reg tempa,tempb;
integer i;
bidir_buf DUT(a,b,ctrl);
assign a=ctrl?tempa:1'bz;
assign b=~ctrl?tempb:1'bz;
initial begin 
    for(i=0;i<8;i=i+1)
    begin {tempa,tempb,ctrl}=i;#10;
        end
        end
        initial $monitor("a=%b,b=%b,ctrl=%b",a,b,ctrl);
    endmodule
*/