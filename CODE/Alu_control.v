module  Alu_control(ALUOP,ALUcontrol);

input [1:0] ALUOP;
output reg[2:0] ALUcontrol;

always @(*)
	case(ALUOP)
		0: ALUcontrol=3'd1;//AND
		1: ALUcontrol=3'd3;//OR
		2: ALUcontrol=3'd5;//ADD
		3: ALUcontrol=3'd6;//SUB
	endcase
endmodule