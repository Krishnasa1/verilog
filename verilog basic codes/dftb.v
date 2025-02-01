module tb_three_bit_multiplier;

  reg [2:0] A, B;
  wire [5:0] P;

  three_bit_multiplier uut (
    .A(A), 
    .B(B), 
    .P(P)
  );

  initial begin
    A = 3'b111;
    B = 3'b110;

    #10;

    $display("A = %b, B = %b, P = %b", A, B, P);
    $display("Expected Product (decimal) = %d", A * B);
  end

endmodule