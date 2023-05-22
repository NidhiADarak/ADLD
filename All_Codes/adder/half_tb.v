module half_tb;
reg a,b;
wire sum,carry;
adder dut(sum,carry,a,b);
initial begin
$monitor("a=%b b=%b sum=%b carry=%b",a,b,sum,carry);
a=0; b=0;
#1 a=0; b=1;
#1 a=1; b=0;
#1 a=1; b=1;
#1;
end
endmodule

module adder(sum,carry,a,b);
input a,b;
output sum,carry;
assign sum = a^b;
assign carry=a&b;
endmodule
