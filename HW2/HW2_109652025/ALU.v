module ALU(result, zero, overflow, aluSrc1, aluSrc2, invertA, invertB, operation);
   
  output wire[31:0] result;
  output wire zero;
  output wire overflow;

  input wire[31:0] aluSrc1;
  input wire[31:0] aluSrc2;
  input wire invertA;
  input wire invertB;
  input wire[1:0] operation;
  
  /*your code here*/

  wire carry[32:0];
  assign carry[0] = (invertA == 1'b0 && invertB == 1'b1) ? 1'b1 : 1'b0;
  wire set, out1, out2;

  ALU_1bit alu1bit0(result[0], carry[1], aluSrc1[0], aluSrc2[0], invertA, invertB, operation, carry[0], set);
  ALU_1bit alu1bit1(result[1], carry[2], aluSrc1[1], aluSrc2[1], invertA, invertB, operation, carry[1], 1'b0);
  ALU_1bit alu1bit2(result[2], carry[3], aluSrc1[2], aluSrc2[2], invertA, invertB, operation, carry[2], 1'b0);
  ALU_1bit alu1bit3(result[3], carry[4], aluSrc1[3], aluSrc2[3], invertA, invertB, operation, carry[3], 1'b0);
  ALU_1bit alu1bit4(result[4], carry[5], aluSrc1[4], aluSrc2[4], invertA, invertB, operation, carry[4], 1'b0);
  ALU_1bit alu1bit5(result[5], carry[6], aluSrc1[5], aluSrc2[5], invertA, invertB, operation, carry[5], 1'b0);      
  ALU_1bit alu1bit6(result[6], carry[7], aluSrc1[6], aluSrc2[6], invertA, invertB, operation, carry[6], 1'b0);      
  ALU_1bit alu1bit7(result[7], carry[8], aluSrc1[7], aluSrc2[7], invertA, invertB, operation, carry[7], 1'b0);      
  ALU_1bit alu1bit8(result[8], carry[9], aluSrc1[8], aluSrc2[8], invertA, invertB, operation, carry[8], 1'b0);      
  ALU_1bit alu1bit9(result[9], carry[10], aluSrc1[9], aluSrc2[9], invertA, invertB, operation, carry[9], 1'b0);     
  ALU_1bit alu1bit10(result[10], carry[11], aluSrc1[10], aluSrc2[10], invertA, invertB, operation, carry[10], 1'b0);
  ALU_1bit alu1bit11(result[11], carry[12], aluSrc1[11], aluSrc2[11], invertA, invertB, operation, carry[11], 1'b0);
  ALU_1bit alu1bit12(result[12], carry[13], aluSrc1[12], aluSrc2[12], invertA, invertB, operation, carry[12], 1'b0);
  ALU_1bit alu1bit13(result[13], carry[14], aluSrc1[13], aluSrc2[13], invertA, invertB, operation, carry[13], 1'b0);
  ALU_1bit alu1bit14(result[14], carry[15], aluSrc1[14], aluSrc2[14], invertA, invertB, operation, carry[14], 1'b0);
  ALU_1bit alu1bit15(result[15], carry[16], aluSrc1[15], aluSrc2[15], invertA, invertB, operation, carry[15], 1'b0);
  ALU_1bit alu1bit16(result[16], carry[17], aluSrc1[16], aluSrc2[16], invertA, invertB, operation, carry[16], 1'b0);
  ALU_1bit alu1bit17(result[17], carry[18], aluSrc1[17], aluSrc2[17], invertA, invertB, operation, carry[17], 1'b0);
  ALU_1bit alu1bit18(result[18], carry[19], aluSrc1[18], aluSrc2[18], invertA, invertB, operation, carry[18], 1'b0);
  ALU_1bit alu1bit19(result[19], carry[20], aluSrc1[19], aluSrc2[19], invertA, invertB, operation, carry[19], 1'b0);
  ALU_1bit alu1bit20(result[20], carry[21], aluSrc1[20], aluSrc2[20], invertA, invertB, operation, carry[20], 1'b0);
  ALU_1bit alu1bit21(result[21], carry[22], aluSrc1[21], aluSrc2[21], invertA, invertB, operation, carry[21], 1'b0);
  ALU_1bit alu1bit22(result[22], carry[23], aluSrc1[22], aluSrc2[22], invertA, invertB, operation, carry[22], 1'b0);
  ALU_1bit alu1bit23(result[23], carry[24], aluSrc1[23], aluSrc2[23], invertA, invertB, operation, carry[23], 1'b0);
  ALU_1bit alu1bit24(result[24], carry[25], aluSrc1[24], aluSrc2[24], invertA, invertB, operation, carry[24], 1'b0);
  ALU_1bit alu1bit25(result[25], carry[26], aluSrc1[25], aluSrc2[25], invertA, invertB, operation, carry[25], 1'b0);
  ALU_1bit alu1bit26(result[26], carry[27], aluSrc1[26], aluSrc2[26], invertA, invertB, operation, carry[26], 1'b0);
  ALU_1bit alu1bit27(result[27], carry[28], aluSrc1[27], aluSrc2[27], invertA, invertB, operation, carry[27], 1'b0);
  ALU_1bit alu1bit28(result[28], carry[29], aluSrc1[28], aluSrc2[28], invertA, invertB, operation, carry[28], 1'b0);
  ALU_1bit alu1bit29(result[29], carry[30], aluSrc1[29], aluSrc2[29], invertA, invertB, operation, carry[29], 1'b0);
  ALU_1bit alu1bit30(result[30], carry[31], aluSrc1[30], aluSrc2[30], invertA, invertB, operation, carry[30], 1'b0);
  ALU_1bit alu1bit31(result[31], carry[32], aluSrc1[31], aluSrc2[31], invertA, invertB, operation, carry[31], 1'b0);


  xor xor2(out_1, aluSrc1[31], invertA);
  xor xor3(out_2, aluSrc2[31], invertB);
  
  // overflow detection
  assign overflow = (operation != 2'b10 && operation != 2'b11) ? 1'b0 :
                    ((out_1 == 1'b0 && out_2 == 1'b0 && carry[31] == 1'b1) || 
                     (out_1 == 1'b1 && out_2 == 1'b1 && carry[31] == 1'b0)) ? 1'b1 : 1'b0;

  // sign checking
  assign set = ((out_1 == 1'b1 && out_2 == 1'b1 && carry[31] == 1'b1) ||
                (out_1 == 1'b0 && out_2 == 1'b0 && carry[31] == 1'b1) ||
                (out_1 == 1'b1 && out_2 == 1'b0 && carry[31] == 1'b0) ||
                (out_1 == 1'b0 && out_2 == 1'b1 && carry[31] == 1'b0)) ? 1'b1 : 1'b0;

  // set zero
  nor nor1(zero, result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7], result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15], result[16], result[17], result[18], result[19], result[20], result[21], result[22], result[23], result[24], result[25], result[26], result[27], result[28], result[29], result[30], result[31]);
	  
endmodule