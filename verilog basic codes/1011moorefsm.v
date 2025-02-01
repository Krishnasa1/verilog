`timescale 1ns / 1ps
module sai(x,clk,reset,z);
input x,clk;
input reset;
output reg z;
parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100;        //representing states
reg [2:0]ps,ns;
always @(posedge clk,posedge reset)
begin
if(reset==1)                //reset state condition
ps<=s0;
else
ps<=ns;
end
always @(ps,x)
begin
case(ps)                //according to moore state diagram
s0:begin
if (x==1)
ns=s1;
else
ns=s0;
$display(ps);
end
s1:begin
if (x==0)
ns=s2;
else
ns=s1;
$display(ps);
end
s2:begin
if (x==1)
ns=s3;
else
ns=s0;
$display(ps);
end
s3:begin
if (x==1)
ns=s4;
else
ns=s2;
$display(ps);
end
s4:begin
if(x==0)
ns=s0;
else
ns=s1;
$display(ps);
end
default: ns=s0;
endcase
end
always @ (ps)
begin
case(ps)                    //outputs at states
s0: z=0;
s1: z=0;
s2: z=0;
s3: z=0;
s4: z=1;
endcase
end
endmodule