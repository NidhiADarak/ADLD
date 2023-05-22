module fourbit_adder(a,b,c,sum,carry);
input [3:0]a,b;
input c;
output [3:0]sum;
output carry;
wire c1,c2,c3;
fulladder fa1(a[0],b[0],c,sum[0],c1);
fulladder fa2(a[1],b[1],c1,sum[1],c2);
fulladder fa3(a[2],b[2],c2,sum[2],c3);
fulladder fa4(a[3],b[3],c3,sum[3],carry);
endmodule


module fulladder(a,b,c,sum,carry);
input a,b,c;
output sum, carry;
wire s1,c1,c2,c3;
assign s1=a^b;
assign sum=s1^c;
assign c1=a&b;
assign c2=b&c;
assign c3=a&c;
assign carry=c1|c2|c3;
endmodule
