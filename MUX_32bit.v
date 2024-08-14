module MUX_32bit #(parameter WIDTH = 32) (OP,A,B,O);

input [WIDTH-1:0] A,B;
input OP;
output [WIDTH-1:0] O;

assign O=(OP==1)?A:B;

endmodule
