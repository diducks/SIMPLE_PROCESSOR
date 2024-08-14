module MUX_32_bit #(parameter WIDTH = 32) (OP,A,B,O);
input [WIDTH-1:0] A,B;
input OP;
output reg [WIDTH-1:0] O;
always @(*) begin
O=(OP==0)?A:B;
end
endmodule
