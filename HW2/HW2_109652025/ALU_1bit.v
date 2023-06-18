module ALU_1bit(result, carryOut, a, b, invertA, invertB, operation, carryIn, less); 
  
  output wire result;
  output wire carryOut;
  
  input wire a;
  input wire b;
  input wire invertA;
  input wire invertB;
  input wire[1:0] operation;
  input wire carryIn;
  input wire less;
  
  /*your code here*/

  wire out0, out1, out2, out3, out_a, out_b;
  xor xor1(out_a, a, invertA);
  xor xor2(out_b, b, invertB);
  or or1(out0, out_a, out_b);
  and and1(out1, out_a, out_b);
  Full_adder full_adder(out2, carryOut, carryIn, out_a, out_b);
  assign out3 = less;
  assign result = (operation == 2'b00) ?  out0 : 
                  (operation == 2'b01) ?  out1 : 
                  (operation == 2'b10) ?  out2 : 
                                          out3;
  
endmodule