module tb_Counters;
    reg clk;
    reg reset;
    wire [3:0] counter1;
    wire [3:0] counter2;
    Counters uut (
        .clk(clk),
        .reset(reset),
        .counter1(counter1),
        .counter2(counter2)
    );

    initial begin
        clk = 0;
        forever #10 clk = ~clk;            //actually we need 500ns for 1mhz frequ 
    end

    initial begin
        reset = 1;
        #10; 
        reset = 0;
        #500;  $finish; 
    end


endmodule