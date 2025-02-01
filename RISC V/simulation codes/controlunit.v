module controll_unit(
//inputs
input I_clk,
input I_reset,
//outputs
output o_enfetch,
output o_endec,
output o_enrgrd,
output o_enalu,
output o_enrgwr,
output o_enmem,
output update
);
//register declaration
reg [5:0]state ;
// initial block
initial
begin
state<= 6'b000001;
end
//state select block
always@(posedge I_clk)
begin
if(I_reset)state<=6'b000001;
else
begin
case(state)
6'b000001 : state<=6'b000010;
6'b000010 : state<=6'b000100;
6'b000100 : state<=6'b001000;
6'b001000 : state<=6'b010000;
6'b010000 : state<=6'b100000;
default : state<=6'b000001;
endcase
end
end
//assignment enable signals
assign o_enfetch=state[0];
assign o_endec=state[1];
assign o_enrgrd=state[2] ;
assign o_enalu=state[3];
assign o_enrgwr=state[4];
assign o_enmem=state[5];
endmodule