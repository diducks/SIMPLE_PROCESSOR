module REGFILE(RWE,WA,WD,RA1,RA2,CLK,RD1,RD2);
input RWE,CLK; 
input [31:0] WD;
input [4:0] WA,RA1,RA2;
//RWE: read write enable
//WA: write address
//WD: write data
//RA1,RA2: read address


output [31:0] RD1,RD2;
reg [31:0] REG32X32 [31:0]; // reg [size] name [size]

initial begin
	REG32X32[5'b00000] = 32'd1;  // Address 0
   REG32X32[5'b00001] = 32'd1;  // Address 1
   REG32X32[5'b00010] = 32'd2;  // Address 2
   REG32X32[5'b00011] = 32'd3;  // Address 3
   REG32X32[5'b00100] = 32'd4;  // Address 4
   REG32X32[5'b00101] = 32'd5;  // Address 5
   REG32X32[5'b00110] = 32'd6;  // Address 6
   REG32X32[5'b00111] = 32'd7;  // Address 7
   REG32X32[5'b01000] = 32'd8;  // Address 8
   REG32X32[5'b01001] = 32'd9;  // Address 9
   REG32X32[5'b01010] = 32'd10; // Address 10
end

always @(posedge CLK) begin

	if(RWE)begin
		REG32X32[WA] <= WD;//wd write data
	end
end
assign RD1 =(RWE)? REG32X32[RA1] :32'bz;
assign RD2 =(RWE)? REG32X32[RA2] :32'bz;
endmodule