module inst_dec(
//inputs
input I_clk,
input I_en,
input [15:0] I_inst,
//outputs
output reg [4:0]o_aluop,output reg [3:0] o_selA,
output reg [3:0] o_selB,
output reg [3:0] o_selD,
output reg [15:0] o_imm,
output reg o_regwe
);
initial
begin
o_aluop <=0;
o_selA <=0;
o_selB <=0;
o_selD <=0;
o_imm <=0;
o_regwe <=0;
end
//instruction decoder block
always@(negedge I_clk)
begin
if(I_en)
begin
o_aluop <=I_inst[15:11];
o_selA<= I_inst[10:8];
//opcode
//REG A
o_selB<= I_inst[7:5]; //REG B
o_selD<= I_inst[4:2]; //REG D
o_imm
<= I_inst[7:0];
//Imm Data//REG Write Enable
case(I_inst[15:12])
4'b0111: o_regwe <= 0;
4'b1100: o_regwe <= 0;
4'b1101: o_regwe <= 0;
default: o_regwe <= 1;
endcase
end
end
endmodule