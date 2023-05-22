module deco_3to8(i1,i2,i3,o1,o2,o3,o4,o5,o6,o7,o8);
input i1,i2,i3;
output o1,o2,o3,o4,o5,o6,o7,o8;
assign o1=~i1&~i2&~i3;
assign o1=~i1&~i2&i3;
assign o1=~i1&i2&~i3;
assign o1=~i1&i2&i3;
assign o1=i1&~i2&~i3;
assign o1=i1&~i2&i3;
assign o1=i1&i2&~i3;
assign o1=i1&i2&i3;
endmodule
