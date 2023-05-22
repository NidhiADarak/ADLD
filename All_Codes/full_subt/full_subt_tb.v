module full_subt_tb;
reg a,b,c;
wire d,borrow;
full_sub dut(a,b,c,d,borrow);
initial begin
$monitor("a=%b b=%b c=%b d=%b borrow=%b",a,b,c,d,borrow);   
a=0;b=0;c=0;
#1 a=0;b=0;c=1;
#1 a=0;b=1;c=0;
#1 a=0;b=1;c=1;
#1 a=1;b=0;c=0;
#1 a=1;b=0;c=1;
#1 a=1;b=1;c=0;
#1 a=1;b=1;c=1;
#1;
end
endmodule

module full_sub(a,b,c,d,borrow);
input a,b,c;
output d,borrow;
assign d = a^b^c;
assign borrow = (~a&b) | (~a|b)&c;
endmodule
