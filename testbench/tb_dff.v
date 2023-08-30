`timescale 1ns/1ns
module tb_dff ();

reg d,rst,clk;
reg [1:0]i;
wire out, outbar;

task delay;
    #10;
endtask

task stmulus([1:0]x);begin
    rst=x[1];
    d=x[0];
end
endtask

task initialise;begin
    d=1'b0;
    rst=1'b0;
end    
endtask

dff DUT(d,clk,rst,out,outbar);

initial begin
    clk=1'b0;
    forever begin
        #10 clk=~clk;
    end
end

initial begin
    initialise;
    for (i= 0;i<4 ;i=i+1 ) begin
        stmulus(i);
        delay;
    end
end
endmodule
