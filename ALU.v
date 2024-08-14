module ALU(A,B,O,OP,OF);
parameter WIDTH = 32;
input [WIDTH-1:0] A,B;
input [2:0] OP;
output reg [WIDTH-1:0] O;
output reg OF;
always @(*)
	case(OP)
	3'b000: 	begin 
					O=~A;
					OF=1'b0;
				end
	3'b001: begin 
					O=A&B;
					OF=1'b0;
				end
	3'b010: begin 
					O=A^B;//xor
					OF=1'b0;
				end
	3'b011:  begin 
					O=A|B;//or
					OF=1'b0;
				end
	3'b100: 	begin 
					O=A-1;
					if (A[31]==1 && O[31]==0) OF=1'b1;
					else  OF=1'b0;
				end
	3'b101: 	begin 
					O=A+B;
					if (A[31]==0 && B[31]==0 && O[31]==1)OF=1'b1;
					else if (A[31]==1&& B[31]==1 && O[31]==0)OF=1'b1;
					else OF=1'b0;
				end
	3'b110: 	begin 
					O=A-B;
					if (A[31]==0 && B[31]==1 && O[31]==1)OF=1'b1;
					else if(A[31]==1&& O[31]==0)OF=1'b1;
					else OF=1'b0;
				end
	3'b111: 
					begin 
					O=A+1;
					if (A[31]==0&& O[31]==1)OF=1'b1;
					else OF=1'b0;
				end
	endcase

endmodule