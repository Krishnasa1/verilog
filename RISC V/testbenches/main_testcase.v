/*module main_test;
// variable declaration
//regs
reg I_clk;
reg I_reset;
reg I_we=0;
reg [15:0]I_data=0;
reg [2:0]I_selA;
reg [2:0]I_selB;
reg [2:0]I_selD;
reg [4:0]I_aluop;
reg I_en;
reg [15:0]I_inst;
reg [15:0]I_dataA;
reg [15:0]I_addr;
reg [15:0]I_dataB;
reg [15:0]I_dataD;
reg [15:0]I_pc;
reg [7:0]I_imm;//wires
wire [3:0]o_selA;
wire [3:0]o_selB;
wire [3:0]o_selD;
wire [15:0]o_dataA;
wire [15:0]o_dataB;
wire [15:0]o_dataD;
wire [4:0]o_aluop;
wire [15:0]o_dataresult;
wire [15:0]o_imm;
wire [15:0]o_data;
wire o_regwe;
wire [15:0]o_pc;
wire [1:0]I_opcode;
wire o_shldbranch;
wire o_enfetch;
wire o_enalu;
wire o_endec;
wire o_enmem;
wire o_enrgrd;
wire o_enrgwr;
wire update;
//assignments
assign o_enrgwr= o_regwe & update;assign I_opcode=(I_reset)?2'b11:((o_shldbranch) ? 2'b10:((o_enmem)?2'b01:2'b00));
// Instantiate the Unit Under Test (UUT)
reg_file main_reg (
.I_clk(I_clk),
.I_en(I_en),
.I_we(I_we),
.I_selA(I_selA),
.I_selB(I_selB),
.I_selD(I_selD),
.I_dataD(I_dataD),
.o_dataA(o_dataA),
.o_dataB(o_dataB)
);
inst_dec main_inst (
.I_clk(I_clk),
.I_en(I_en),
.I_inst(I_inst),
.o_aluop(o_aluop),
.o_selA(o_selA),
.o_selB(o_selB),
.o_selD(o_selD),
.o_imm(o_imm),
.o_regwe(o_regwe)
);
alu main_alu(//inputs
.I_clk(I_clk),
.I_en(I_en),
.I_aluop(I_aluop),
.I_dataA(I_dataA),
.I_dataB(I_dataB),
.I_imm(I_imm),
//outputs
.o_dataresult(o_dataresult),
.o_shldbranch(o_shldbranch)
);
controll_unit main_control(
//inputs
.I_clk(I_clk),
.I_reset(I_reset),
//outputs
.o_enfetch(o_enfetch),
.o_endec(o_endec),
.o_enrgrd(o_enrgrd),
.o_enalu(o_enalu),
.o_enrgwr(o_enrgwr),
.o_enmem(o_enmem),
.update(update)
);
pc_unit main_pc(//Inputs
I_clk,
I_opcode,
I_pc,
//outputs
o_pc
);
fake_ram main_fake(
//inputs
I_clk,
I_we,
I_addr,
I_data,
//outputs
o_data
);
initial begin
I_clk=0;
I_reset=1;
#20
I_reset=0;
end
//clock generation
always begin
#5;I_clk=~I_clk;
end
endmodule */
module main_test;
// variable declaration
//regs
reg I_clk;
reg I_reset;
reg I_we = 0;
reg [15:0] I_data = 0;
reg [2:0] I_selA;
reg [2:0] I_selB;
reg [2:0] I_selD;
reg [4:0] I_aluop;
reg I_en;
reg [15:0] I_inst;
reg [15:0] I_dataA;
reg [15:0] I_addr;
reg [15:0] I_dataB;
reg [15:0] I_dataD;
reg [15:0] I_pc;
reg [7:0] I_imm;

// wires
wire [3:0] o_selA;
wire [3:0] o_selB;
wire [3:0] o_selD;
wire [15:0] o_dataA;
wire [15:0] o_dataB;
wire [15:0] o_dataD;
wire [4:0] o_aluop;
wire [15:0] o_dataresult;
wire [15:0] o_imm;
wire [15:0] o_data;
wire o_regwe;
wire [15:0] o_pc;
wire [1:0] I_opcode;
wire o_shldbranch;
wire o_enfetch;
wire o_enalu;
wire o_endec;
wire o_enmem;
wire o_enrgrd;
wire o_enrgwr;
wire update;

// Assignments
assign o_enrgwr = o_regwe & update;
assign I_opcode = (I_reset) ? 2'b11 : ((o_shldbranch) ? 2'b10 : ((o_enmem) ? 2'b01 : 2'b00));

// Instantiate the Unit Under Test (UUT)
reg_file main_reg (
    .I_clk(I_clk),
    .I_en(I_en),
    .I_we(I_we),
    .I_selA(I_selA),
    .I_selB(I_selB),
    .I_selD(I_selD),
    .I_dataD(I_dataD),
    .o_dataA(o_dataA),
    .o_dataB(o_dataB)
);

inst_dec main_inst (
    .I_clk(I_clk),
    .I_en(I_en),
    .I_inst(I_inst),
    .o_aluop(o_aluop),
    .o_selA(o_selA),
    .o_selB(o_selB),
    .o_selD(o_selD),
    .o_imm(o_imm),
    .o_regwe(o_regwe)
);

alu main_alu (
    // Inputs
    .I_clk(I_clk),
    .I_en(I_en),
    .I_aluop(I_aluop),
    .I_dataA(I_dataA),
    .I_dataB(I_dataB),
    .I_imm(I_imm),
    // Outputs
    .o_dataresult(o_dataresult),
    .o_shldbranch(o_shldbranch)
);

controll_unit main_control (
    // Inputs
    .I_clk(I_clk),
    .I_reset(I_reset),
    // Outputs
    .o_enfetch(o_enfetch),
    .o_endec(o_endec),
    .o_enrgrd(o_enrgrd),
    .o_enalu(o_enalu),
    .o_enrgwr(o_enrgwr),
    .o_enmem(o_enmem),
    .update(update)
);

pc_unit main_pc (
    // Inputs
    I_clk,
    I_opcode,
    I_pc,
    // Outputs
    o_pc
);

fake_ram main_fake (
    // Inputs
    I_clk,
    I_we,
    I_addr,
    I_data,
    // Outputs
    o_data
);

// Initial block for input simulation
initial begin
    // Initialize clock and reset
    I_clk = 0;
    I_reset = 1;

    // Step 1: Reset the system
    #20;
    I_reset = 0;

    // Step 2: Provide an instruction to the instruction decoder
    I_en = 1;           // Enable processing
    I_inst = 16'h1234;  // Provide a dummy instruction
    I_selA = 3'b001;    // Register select for A
    I_selB = 3'b010;    // Register select for B
    I_selD = 3'b011;    // Destination register

    // Step 3: Simulate ALU operation
    #10;
    I_aluop = 5'b00001;  // Example ALU operation (e.g., ADD)
    I_dataA = 16'hAAAA;  // First operand
    I_dataB = 16'h5555;  // Second operand

    // Step 4: Write data to memory
    #10;
    I_we = 1;            // Enable write
    I_addr = 16'h0004;   // Write address
    I_data = 16'hDEAD;   // Data to write

    // Step 5: Read data from memory
    #10;
    I_we = 0;            // Disable write
    I_addr = 16'h0004;   // Read address

    // Step 6: Update the PC
    #10;
    I_pc = 16'h0008;     // Update PC to a new address

    // Wait and stop simulation
    #50;
    $stop;
end

// Clock generation
always #5 I_clk = ~I_clk;

endmodule
