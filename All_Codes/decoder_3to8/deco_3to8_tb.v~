module deco_3to8_tb;
reg i1,i2,i3;
wire o1,o2,o3,o4,o5,o6,o7,o8;
deco_3to8 dut(i1,i2,i3,o1,o2,o3,o4,o5,o6,o7,o8);
initial begin
$monitor("i1=%b i2=%b i3=%b o1=%b o2=%b o3=%b o4=%b o5=%b o6=%b o7=%b o8=%b",i1,i2,i3,o1,o2,o3,o4,o5,o6,o7,o8);
i1=1'b0; i2=1'b0; i3=1'b0; 
#1 i1=1'b0; i2=1'b0; i3=1'b1;
#1 i1=1'b0; i2=1'b1; i3=1'b0;
#1 i1=1'b0; i2=1'b1; i3=1'b1;
#1 i1=1'b1; i2=1'b0; i3=1'b0;
#1 i1=1'b1; i2=1'b0; i3=1'b1;
#1 i1=1'b1; i2=1'b1; i3=1'b0;
#1 i1=1'b1; i2=1'b1; i3=1'b1;
#1;
end
endmodule

module deco_3to8(i1,i2,i3,o1,o2,o3,o4,o5,o6,o7,o8);
input i1,i2,i3;
output o1,o2,o3,o4,o5,o6,o7,o8;
assign o1=~i1&~i2&~i3;
assign o2=~i1&~i2&i3;
assign o3=~i1&i2&~i3;
assign o4=~i1&i2&i3;
assign o5=i1&~i2&~i3;
assign o6=i1&~i2&i3;
assign o7=i1&i2&~i3;
assign o8=i1&i2&i3;
endmodule
