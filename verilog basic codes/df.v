module three_bit_multiplier(A, B, P);
  input [2:0] A, B;        
  output [5:0] P;          
  assign P = A * B;       
endmodule