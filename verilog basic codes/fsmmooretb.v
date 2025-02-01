//testbench module
module fsmtb;
reg x,clk,reset;
wire z;
sai uut(.x(x),.clk(clk),.reset(reset),.z(z));
initial
begin
clk=0;
reset =1;
#15 reset =0;
forever #10 clk=~clk;
end
initial begin
$monitor ("Time:%0d,x=%b,z=%b",$time,x,z);      //monitoring valuesss
        #25 x = 1;#10 x = 0 ; #10 x = 1 ; #10 x = 1 ;
        #20 x = 1;#10 x = 1 ; #10 x = 0 ; #10 x = 1 ;
        #20 x = 1;#10 x = 0 ; #10 x = 0 ; #10 x = 1 ;
        #20 x = 0;#10 x = 1 ; #10 x = 1 ; #10 x = 0 ;
        #10 $finish;
    end

endmodule
