module full_subt(a,b,c,d,borrow);
input a,b,c;
output d,borrow;
assign d = a^b^c;
assign borrow = (~a&b) | (~a|b)c;
endmodule
