module regfile_unittest;
    // Inputs
    reg I_clk;
    reg I_en;
    reg I_we;
    reg [2:0] I_selA;
    reg [2:0] I_selB;
    reg [2:0] I_selD;
    reg [15:0] I_dataD;
    
    // Outputs
    wire [15:0] o_dataA;
    wire [15:0] o_dataB;
    
    // Instantiate the Unit Under Test (UUT)
    reg_file uut (
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
    
    /* testing process for reference
     * 1) read r0 and r1, write 0xFFFF to r0
     * 2) ensure 0xFFFF appears on data out line, write 0x2222 to r2
     * 3) write 0x3333 to r2, testing multiple writes to the same location
     * 4) set up as if writing 0xFEED to r0 but don't enable the I_we
     * 5) write 0x4444 to r4, ensure 0xFEED was not written to r0
     * 6) after waiting multiple clock cycles, read r4 on both output A and B
     */
    initial begin
        // Initialize Inputs
        // Reset all inputs
        I_clk = 0;
        I_en = 0;
        I_we = 0;
        I_selA = 0;
        I_selB = 0;
        I_selD = 0;
        I_dataD = 0;
        
        // Start Test
        #7;
        I_en = 1'b1;
        I_selA = 3'b000;
        I_selB = 3'b001;
        I_selD = 3'b000;
        I_dataD = 16'hFFFF;
        I_we = 1'b1;
        
        #10;
        I_we = 1'b0;
        I_selD = 3'b010;
        I_dataD = 16'h2222;
        
        #10;
        I_we = 1;
        
        #10;
        I_dataD = 16'h3333;
        
        #10;
        I_we = 0;
        I_selD = 3'b000;
        I_dataD = 16'hFEED;
        
        #10;
        I_selD = 3'b100;
        I_dataD = 16'h4444;
        
        #10;
        I_we = 1;
        
        #50;
        I_selA = 3'b100;
        I_selB = 3'b100;
    end
    
    // Clock Generation
    always begin
        #5 I_clk = ~I_clk;
    end
endmodule
