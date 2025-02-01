module Counters(
    input clk,         
    input reset,         // Reset signal
    output reg [3:0] counter1,  // First 4-bit up-counter
    output reg [3:0] counter2   // Second 4-bit down-counter
);

    // Counter1: 4-bit up-counter
    always @(posedge clk or posedge reset)
     begin
        if (reset) begin
            counter1 <= 4'b0000;    //initial state of upcounter
            counter2 <= 4'b1111;    //initial state of down counter
        end else begin
            counter1 <= counter1 + 4'b0001;  

            if (counter1 == 4'b1100)    //cvndition for second counter
            begin
                counter2 <= counter2 - 1;  
            end
        end
    end

endmodule