module deco_2to4_tb;
reg i1,i2;
wire o1,o2,o3,o4;
deco_2to4 dut(i1,i2,o1,o2,o3,o4);
initial begin
$monitor("i1=%b i2=%b o1=%b o2=%b o3=%b o4=%b",i1,i2,o1,o2,o3,o4);
i1=1'b0;
i2=1'b0;
#1
i1=1'b0;
i2=1'b1;
#1
i1=1'b1;
i2=1'b0;
#1
i1=1'b1;
i2=1'b1;
#1;
end
endmodule

module deco_2to4(i1,i2,o1,o2,o3,o4);
input i1,i2;
output o1,o2,o3,o4;
assign o1=~i1&~i2;
assign o2=~i1&i2;
assign o3=i1&~i2;
assign o4=i1&i2;
endmodule
