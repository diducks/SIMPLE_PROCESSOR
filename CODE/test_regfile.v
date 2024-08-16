`timescale 1ns/100ps
module test_regfile;
reg RWE;
reg CLK;
reg [4:0] WA,RA1,RA2;
wire [31:0] RD1,RD2;
reg [31:0] WD;
REGFILE uut(RWE,WA,WD,RA1,RA2,CLK,RD1,RD2);
initial begin
	#0
	CLK=0;
	RWE=1;
	#10
	RA1=4'b0001;RA2=4'b0010;
	WA=4'b0001;
	WD=32'd32;
	#10
	RA1=4'b0010;RA2=4'b0001;
	WA=4'b0010;
	WD=32'd22;
end
always #5 CLK=~CLK;

endmodule