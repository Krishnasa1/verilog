module decoder_unittest;
// Inputs
reg I_clk;
reg I_en;
reg [15:0] I_inst;
// Outputs
wire [4:0] o_aluop;
wire [3:0] o_selA;
wire [3:0] o_selB;
wire [3:0] o_selD;
wire [15:0] o_imm;
wire o_regwe;
// Instantiate the Unit Under Test (UUT)
inst_dec uut (
.I_clk(I_clk),
.I_en(I_en),
.I_inst(I_inst),
.o_aluop(o_aluop),
.o_selA(o_selA),
.o_selB(o_selB),
.o_selD(o_selD),
.o_imm(o_imm),
.o_regwe(o_regwe));
initial begin
// Initialize Inputs - TIME=0
I_clk = 0;
I_en = 0;
I_inst = 0;
//TIME=10
#10;
I_inst=16'b1110000000000100;
//TIME=20
I_en=1;
end
always begin
#5;
I_clk=~I_clk;
end
endmodule