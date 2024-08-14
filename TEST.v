//`timescale 1ns/1ps
//
//module DATAPATH_tb;
//
//  reg CLK;
//  reg [25:0] INST;
//  reg REGDST, ALUSRC, MEMWRITE, MEMREAD, MEMTOREG, REGWRITE;
//  wire [31:0] OUT;
//
//  DATAPATH DUT(
//    .CLK(CLK),
//    .INST(INST),
//    .REGDST(REGDST),
//    .ALUSRC(ALUSRC),
//    .MEMWRITE(MEMWRITE),
//    .MEMREAD(MEMREAD),
//    .ALUCONTROL(101),  // Assuming ALUCONTROL for lw and sw is 101
//    .MEMTOREG(MEMTOREG),
//    .REGWRITE(REGWRITE),
//    .OUT(OUT)
//  );
//  
////REGFILE REG1(.RWE(REGWRITE),.WA(WR),.WD(WD),.RA1(INST[25:21]),.RA2(INST[20:16]),.CLK(CLK),.RD1(RD1),.RD2(RD2));
//
//  initial begin
//    CLK = 0; REGDST = 1; ALUSRC = 0; MEMWRITE = 0; MEMREAD = 0; MEMTOREG = 0; REGWRITE = 1;
//
//    // Test case 1: R-type instruction (e.g., ADD)
//    INST = 32'b00010_00011_00001_00000000000;  // ADD $1, $2, $3
//	 
//    #20;
//
//    // Test case 2: lw instruction
//    INST = 32'b00010_00001_00000_00000000000;  // lw $1, 0($2) 
//    #20;
//
//    // Test case 3: sw instruction
//    INST = 32'b00010_00001_00000_00000000000;  // sw $1, 0($2)
//    #20;
//
//    $stop;
//  end
//
//  always #10 begin
//    CLK = ~CLK;
//	 #1 $display("OUTPUT: %d",OUT);
//  end
//
//endmodule
