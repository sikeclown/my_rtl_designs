module alu (
	input [7:0]a,b, 
	input [3:0]command,
	input en,
	output reg [15:0] out
);
	
parameter 	 
    ADD  = 4'b0000, // Add two 8 bit numbers a and b.
	INC  = 4'b0001, // Increment a by 1. 
	SUB  = 4'b0010, // Subtracts b from a.
	DEC  = 4'b0011, // Decrement a by 1.
	MUL  = 4'b0100, // Multiply 4 bit numbers a and b.
	DIV  = 4'b0101, // Divide a by b.
	SHL  = 4'b0110, // Shift a to left side by 1 bit.
	SHR  = 4'b0111, // Shift a to right by 1 bit.
	AND  = 4'b1000, // Logical AND operation
	OR   = 4'b1001, // Logical OR operation
	INV  = 4'b1010, // Logical Negation
	NAND = 4'b1011, // Bitwise NAND
	NOR  = 4'b1100, // Bitwise NOR
	XOR  = 4'b1101, // Bitwise XOR
	XNOR = 4'b1110, // Bitwise XNOR
	BUF  = 4'b1111; // BUF

always @(*) begin
	if (en) begin
		case (command)
		ADD	: out= a+b;
		INC	: out= a+1;
		SUB	: out= b-a;
		DEC	: out= a-1;
		MUL	: out= a*b;
		DIV	: out= a/b;
		SHL	: out= a<<1;
		SHR	: out= a>>1;
		AND	: out= a&b;
		OR	: out= a|b;
		INV	: out= ~(a&b);
		NAND: out= ~(a|b);
		NOR	: out= ~(a^b);
		XOR	: out= a^b;
		XNOR: out= ~(a^b);
		BUF	: out= a;
	endcase
	end
	else begin
		out=16'bz;
	end
	
	
end


endmodule