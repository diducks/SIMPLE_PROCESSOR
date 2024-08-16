`timescale 1ns/1ps

module DATAPATH_tb;

  reg CLK;
  reg [25:0] INST;
  reg REGDST, ALUSRC, MEMWRITE, MEMREAD, MEMTOREG, REGWRITE;
  wire [31:0] OUT;
  integer COUNT;
  DATAPATH DUT(
    .CLK(CLK),
    .INST(INST),
    .REGDST(REGDST),
    .ALUSRC(ALUSRC),
    .MEMWRITE(MEMWRITE),
    .MEMREAD(MEMREAD),
    .ALUCONTROL(4'b0101),  
    .MEMTOREG(MEMTOREG),
    .REGWRITE(REGWRITE),
    .OUT(OUT)
  );

  initial begin
    CLK = 0; REGDST = 1; ALUSRC = 0; MEMWRITE = 0; MEMREAD = 0; MEMTOREG = 0; REGWRITE = 1;

    // Test case 1: R-type instruction (e.g., ADD)
	 COUNT=0;
    INST = 32'b00010_00011_00001_00000000000;  // ADD $1, $2, $3
    #20;

    // Test case 2: lw instruction
	 COUNT=1;
	 CLK = 0; REGDST = 1; ALUSRC = 1; MEMWRITE = 0; MEMREAD = 1; MEMTOREG = 1; REGWRITE = 1;
    INST = 32'b00010_00001_00000_00000000000;  // lw $1, 0($2) 
    #20;

    // Test case 3: sw instruction
	 COUNT=2;
	 CLK = 0; REGDST = 1'bx; ALUSRC = 1; MEMWRITE = 1; MEMREAD = 0; MEMTOREG = 1/*X*/; REGWRITE = 0;
    INST = 32'b00010_00001_00000_00000000000;  // sw $1, 0($2)
    #20;

    $stop;
  end

  always #10 begin
    CLK = ~CLK;
	 if (COUNT==0)
	 #1 $display("ADD $1,$2,$3 <===> OUTPUT: %d",OUT);
	 else if (COUNT==1)
	 #1 $display("LW $1,0($2) <===> OUTPUT: %d",OUT);
	 else if (COUNT==1)
	 #1 $display("SW $1,0($2) <===> OUTPUT: %d",OUT);
  end

endmodule
