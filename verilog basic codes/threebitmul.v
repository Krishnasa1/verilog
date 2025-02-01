//halfadder module

module half_adder(sum,carry,a,b);
output carry,sum;
input a,b;
assign sum=a^b;
assign carry=(a&b);
endmodule             

//full adder module
module full_adder(sum,carry,x,y,z);
output carry,sum;
input x,y,z;
assign carry=((x&y)|(y&z)|(z&x));
assign sum=x^y^z;
endmodule

 //three bit adder is combination of one half adder and two full adders//// or three full adders/////

// three bit addeer module

module threeadder(carry,s2,s1,s0,a2,a1,a0,b2,b1,b0);
output carry,s2,s1,s0;
input a2,a1,a0,b2,b1,b0;
half_adder w1(s0,carry1,a0,b0);
full_adder w2(s1,carry2,a1,b1,carry1);
full_adder w3(s2,carry,a2,b2,carry2);
endmodule
//multiplier module
module multiplier_adder3(a,b,p);
input [2:0]a,b;
output [5:0]p;
wire x0,x1,y0,y1,y2,z0,z1,z2;   //intermediate wires 
and q1(p[0],a[0],b[0]);
and q2(x0,a[1],b[0]);
and q3(x1,a[2],b[0]);
and q4(y0,a[0],b[1]);
and q5(y1,a[1],b[1]);
and q6(y2,a[2],b[1]);
and q7(z0,a[0],b[2]);
and q8(z1,a[1],b[2]);
and q9(z2,a[2],b[2]);
threeadder z(c2,s22,s12,p[1],y2,y1,y0,0,x1,x0);
threeadder uut(p[5],p[4],p[3],p[2],z2,z1,z0,c2,s22,s12);
endmodule