module SIGN_EXTEND #(parameter WIDTH = 16)(I,O);

input [WIDTH-1:0] I;
output [WIDTH*2-1:0] O;
//assign O=(I[WIDTH-1]==0)?{16'b0000000000000000,I}:{16'b1111111111111111,I};
assign O = {{16{I[WIDTH-1]}}, I};
endmodule
