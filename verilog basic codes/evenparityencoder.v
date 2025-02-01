`timescale 1ns / 1ps
module even_parity (
    input wire [3:0] data_in, // 4-bit data
    output wire parity_bit ,   // 1-bit parity
    output wire [4:0] z     // 5 bit data of encoded
);

    // Calculation
    assign parity_bit = (data_in[0] ^ data_in[1] ^ data_in[2] ^ data_in[3]);
    assign z = {data_in,parity_bit};        //msb=databits;;;;lsb=paritybit
endmodule
