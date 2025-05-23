module fake_ram(
    // Inputs
    input I_clk,
    input I_we,
    input [15:0] I_addr,
    input [15:0] I_data,
    // Output
    output reg [15:0] o_data
);
    
// Memory declaration
reg [15:0] mem [8:0];

// Initial block
initial begin
    mem[0] = 16'b1000000011111110;
    mem[1] = 16'b1000100111101101;
    mem[2] = 16'b0010001000100000;
    mem[3] = 16'b1000001100000001;
    mem[4] = 16'b1000010000000001;
    mem[5] = 16'b0000001101110000;
    mem[6] = 16'b1100000000000101;
    mem[7] = 0;
    mem[8] = 0;
    o_data = 16'b1000000000000000;
end

// RAM operations
always @(negedge I_clk) begin
    if (I_we) begin
        mem[I_addr[3:0]] <= I_data;  // Limit I_addr to fit memory size
    end
    o_data <= mem[I_addr[3:0]];       // Limit I_addr to fit memory size
end

endmodule
