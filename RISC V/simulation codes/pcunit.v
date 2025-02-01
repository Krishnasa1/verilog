module pc_unit(
//Inputs
input I_clk,
input [1:0]I_opcode,
input [15:0]I_pc,
//outputs
output reg [15:0] o_pc
);
//initial block
initial
begin
o_pc<=0;
end
// program counter
always@(negedge I_clk)
begin
case(I_opcode)
2'b00 : o_pc<=o_pc;
2'b01 : o_pc<=o_pc+1;
2'b10 : o_pc<=I_pc;
2'b11 : o_pc<=0;
endcase
end
endmodule