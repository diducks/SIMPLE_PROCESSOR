module MUX_5bit(OP,A,B,O);
parameter WIDTH = 5;
input [WIDTH-1:0] A,B;
input OP;
output [WIDTH-1:0] O;

assign O=(OP==0)?A:B;

endmodule
