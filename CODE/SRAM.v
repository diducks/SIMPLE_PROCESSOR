module SRAM(CLK,WE,RE,WD,RA,ADDRESS);
input [31:0] ADDRESS;
//reg [31:0] SRAM [2**32-1:0];
reg [31:0] SRAM [127:0];

input [31:0] WD;//WA:WriteData
input WE,RE,CLK;
output [31:0] RA;//RA:ReadData
//reg [31:0] temp;
initial begin
	SRAM[32'd0]		=32'd3;
	SRAM[32'd1]		=32'd6;
	SRAM[32'd2]		=32'd7;
	SRAM[32'd3]		=32'd8;
	SRAM[32'd4]		=32'd4;
	SRAM[32'd5]		=32'd5;
	SRAM[32'd6]		=32'd12;
	SRAM[32'd7]		=32'd15;
	SRAM[32'd8]		=32'd18;
	SRAM[32'd9]		=32'd20;	
	SRAM[32'd10]	=32'd1;
end
//always @(posedge CLK) begin
//if (RE && ! WE) begin 
//	RA<=SRAM[ADDRESS];
//	end
//else if (WE && !RE) begin
//	SRAM[ADDRESS]<= WD;
//	end
//else RA<=32'bz;
//end
//endmodule
always @(posedge CLK) begin
	if (WE && !RE) begin
		SRAM[ADDRESS]<= WD;
	end
end
assign RA=(RE)?SRAM[ADDRESS]:32'bz;
endmodule
//always @(posedge CLK) begin
//if (RE && ! WE) begin 
//	temp<=SRAM[ADDRESS];
//	end
//else if (WE && !RE) begin
//	SRAM[ADDRESS]<= WD;
//	end
//else temp<=32'bz;
//end
//assign RA=temp;
//endmodule


