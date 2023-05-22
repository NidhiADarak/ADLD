module subtractor(a,b,din,borrow);
input a,b;
output din,borrow;
assign din=a^b;
assign borrow=~a&b;
endmodule 
