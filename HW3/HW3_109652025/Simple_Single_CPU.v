module Simple_Single_CPU(clk_i, rst_n);

//I/O port
input         clk_i;
input         rst_n;

//Internal Signles

// Program Counter
wire [32-1:0] pc_add4, pc;

// Instruction Memory
wire [32-1:0] instruction;

// Register File
wire [5-1:0] writeRegister;
wire [32-1:0] rsData, rtData, writeData;

// Decoder
wire RegDst, RegWrite, ALUSrc;
wire [3-1:0] ALUOP;

// Sign Extension
wire [32-1:0] signExtended;

// Zero Filled
wire [32-1:0] zeroFilled;

// Shifter
wire [32-1:0] shifter_result;

// ALU Control
wire [4-1:0] ALU_operation;
wire [1:0] FURslt;

// ALU
wire [32-1:0] MUX_ALUSrc, ALU_result;
wire zero, overflow;

//modules
Program_Counter PC(
        .clk_i(clk_i),      
	.rst_n(rst_n),     
	.pc_in_i(pc_add4),   
	.pc_out_o(pc) 
	);
	
Adder Adder1(
        .src1_i(pc),     
	.src2_i(32'd4),
	.sum_o(pc_add4)    
	);
	
Instr_Memory IM(
        .pc_addr_i(pc),  
	.instr_o(instruction)    
        );

Mux2to1 #(.size(5)) Mux_Write_Reg(
        .data0_i(instruction[20:16]),
        .data1_i(instruction[15:11]),
        .select_i(RegDst),
        .data_o(writeRegister)
        );	
		
Reg_File RF(
        .clk_i(clk_i),      
	.rst_n(rst_n),     
        .RSaddr_i(instruction[25:21]),  
        .RTaddr_i(instruction[20:16]),  
        .RDaddr_i(writeRegister),  
        .RDdata_i(writeData), 
        .RegWrite_i(RegWrite),
        .RSdata_o(rsData),  
        .RTdata_o(rtData)   
        );
	
Decoder Decoder(
        .instr_op_i(instruction[31:26]), 
        .RegWrite_o(RegWrite), 
        .ALUOp_o(ALUOP),   
        .ALUSrc_o(ALUSrc),   
        .RegDst_o(RegDst)   
        );

ALU_Ctrl AC(
        .funct_i(instruction[5:0]),   
        .ALUOp_i(ALUOP),   
        .ALU_operation_o(ALU_operation),
        .FURslt_o(FURslt)
        );
	
Sign_Extend SE(
        .data_i(instruction[15:0]),
        .data_o(signExtended)
        );

Zero_Filled ZF(
        .data_i(instruction[15:0]),
        .data_o(zeroFilled)
        );
		
Mux2to1 #(.size(32)) ALU_src2Src(
        .data0_i(rtData),
        .data1_i(signExtended),
        .select_i(ALUSrc),
        .data_o(MUX_ALUSrc)
        );	
		
ALU ALU(
        .aluSrc1(rsData),
	.aluSrc2(MUX_ALUSrc),
	.ALU_operation_i(ALU_operation),
	.result(ALU_result),
	.zero(zero),
	.overflow(overflow)
        );
		
Shifter shifter( 
        .result(shifter_result), 
        .leftRight(ALUOP[0]),
        .shamt(instruction[10:6]),
        .sftSrc(MUX_ALUSrc) 
        );
		
Mux3to1 #(.size(32)) RDdata_Source(
        .data0_i(ALU_result),
        .data1_i(shifter_result),
	.data2_i(zeroFilled),
        .select_i(FURslt),
        .data_o(writeData)
        );			

endmodule
