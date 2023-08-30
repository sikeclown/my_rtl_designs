module tb_alu();

reg [7:0] operand_1;
reg [7:0] operand_2;
reg [3:0] command;
reg en;

wire [15:0] out;

alu DUT(operand_1, operand_2, command, en, out);

initial
begin
operand_1=8'd30; operand_2=8'd40; command=4'b0000; en=1'b1;
#50 operand_1=8'd30; operand_2=8'd40; command=4'b0001; en=1'b1;
#50 operand_1=8'd30; operand_2=8'd40; command=4'b0010; en=1'b1;
#50 operand_1=8'd30; operand_2=8'd40; command=4'b0011; en=1'b1;
#50 operand_1=8'd30; operand_2=8'd40; command=4'b0100; en=1'b1;
#50 operand_1=8'd30; operand_2=8'd40; command=4'b0101; en=1'b1;
#50 operand_1=8'd30; operand_2=8'd40; command=4'b0110; en=1'b1;
#50 operand_1=8'd30; operand_2=8'd40; command=4'b0111; en=1'b1;
#50 operand_1=8'd30; operand_2=8'd40; command=4'b1000; en=1'b1;
#50 operand_1=8'd30; operand_2=8'd40; command=4'b1001; en=1'b1;
#50 operand_1=8'd30; operand_2=8'd40; command=4'b1010; en=1'b1;
#50 operand_1=8'd30; operand_2=8'd40; command=4'b1011; en=1'b1;
#50 operand_1=8'd30; operand_2=8'd40; command=4'b1100; en=1'b1;
#50 operand_1=8'd30; operand_2=8'd40; command=4'b1101; en=1'b1;
#50 operand_1=8'd30; operand_2=8'd40; command=4'b1110; en=1'b1;
#50 operand_1=8'd30; operand_2=8'd40; command=4'b1111; en=1'b1;
#50 operand_1=8'd30; operand_2=8'd40; command=4'b0011; en=1'b0;
#50 operand_1=8'd30; operand_2=8'd40; command=4'b1010; en=1'b0;

end
endmodule
