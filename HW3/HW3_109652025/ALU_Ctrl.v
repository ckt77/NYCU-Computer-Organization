module ALU_Ctrl(funct_i, ALUOp_i, ALU_operation_o, FURslt_o);

//I/O ports 
input      [6-1:0] funct_i;
input      [3-1:0] ALUOp_i;

output     [4-1:0] ALU_operation_o;  
output     [2-1:0] FURslt_o;
     
//Internal Signals
wire	   [4-1:0] ALU_operation_o;
wire	   [2-1:0] FURslt_o;

//Main function
/*your code here*/

assign ALU_operation_o[3:0] = (ALUOp_i == 3'b000) ? 4'b0010 : // addi
                              (funct_i == 6'b010010) ? 4'b0010 : // add
                              (funct_i == 6'b010000) ? 4'b0110 : // sub
                              (funct_i == 6'b010100) ? 4'b0001 : // and
                              (funct_i == 6'b010110) ? 4'b0000 : // or
                              (funct_i == 6'b100000) ? 4'b0111 : // slt
                              (funct_i == 6'b010101) ? 4'b1101 : // nor
                              (funct_i == 6'b000000) ? 4'b0000 : // sll
                                                       4'b0001 ; // srl

assign FURslt_o[1:0] = (ALUOp_i == 3'b010 && (funct_i == 6'b000000 || funct_i == 6'b000010)) ? 2'b01 : 2'b00;

endmodule     
