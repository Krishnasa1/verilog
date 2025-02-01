`timescale 1ns / 1ps
module tb_even_parity_encoder;
    reg [3:0] data_in;          
    wire parity_bit; 
    wire [4:0] z;           

    even_parity uut (
        .data_in(data_in),
        .parity_bit(parity_bit), .z(z)
    );

    initial begin           //data inputs
        data_in = 4'b0000; #10; 
        data_in = 4'b0001; #10; 
        data_in = 4'b0010; #10; 
        data_in = 4'b0011; #10; 
        data_in = 4'b0100; #10; 
        data_in = 4'b0101; #10; 
        data_in = 4'b0110; #10; 
        data_in = 4'b0111; #10; 
        data_in = 4'b1000; #10; 
        data_in = 4'b1001; #10; 
        data_in = 4'b1010; #10; 
        data_in = 4'b1011; #10;
        data_in = 4'b1100; #10; // 0
        data_in = 4'b1101; #10; //  1
        data_in = 4'b1110; #10; // 1
        data_in = 4'b1111; #10; // 0
        $finish; 
    end
endmodule
