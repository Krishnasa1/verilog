`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2024 06:20:43 PM
// Design Name: 
// Module Name: threebittb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module multiplier_tb();
reg [2:0]a,b;
wire [5:0]p;
multiplier_adder3 uut44(.a(a),.b(b),.p(p));
initial
begin
    #15 a=3'b111;b=3'b101;
    #15 a=3'b110;b=3'b101;
    #15 a=3'b110;b=3'b011;
    #15 a=3'b101;b=3'b101;
    #15 a=3'b010;b=3'b110;
    #10 $finish;
end
endmodule