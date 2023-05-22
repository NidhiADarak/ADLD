module subt_tb;
reg a,b;
wire din,borrow;
subtractor s(a,b,din,borrow);
initial begin
$monitor("a=%b b=%b din=%b borrow=%b",a,b,din,borrow);
   a=0; b=0;
#1 a=0; b=1;
#1 a=1; b=0;
#1 a=1; b=1;
#1;
end
endmodule


module subtractor(a,b,din,borrow);
input a,b;
output din,borrow;
assign din=a^b;
assign borrow=~a&b;
endmodule 
