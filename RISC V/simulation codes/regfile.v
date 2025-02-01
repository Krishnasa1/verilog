module reg_file(
//inputs
input I_clk,
input I_en,
input I_we, //write enable
input [2:0] I_selA,
input [2:0] I_selB,
input [2:0] I_selD,
input [15:0] I_dataD,
//outputs
output reg [15:0] o_dataA,
output reg [15:0] o_dataB
);
//internal register declaration
reg [15:0] regs [7:0];
//loop variable
integer count;
//initialize registers
initial
begin
o_dataA=0;
o_dataB=0;
for(count=0;count<8;count=count+1)
begin
regs[count]=0;
end
end
//assigning correct values to OP regs
always@(negedge I_clk)
begin
if(I_en)
begin
if(I_we)
regs[I_selD]<=I_dataD;
o_dataA <= regs[I_selA];
o_dataB <= regs[I_selB];
end
end
endmodule