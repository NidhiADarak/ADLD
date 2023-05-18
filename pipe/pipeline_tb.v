module pipeline_tb();
parameter N=10;
reg [N-1:0]A,B,C,D;
reg clk;
wire [N-1:0]F;
pipe A1(A,B,C,D,clk,F);

initial begin
clk=0;
#10
A=10;
B=12;
C=6;
D=3;
#20;
A=5;
B=3;
C=4;
D=2;
#30;
A=15;
B=10;
C=6;
D=3;
end

always #5 clk=~clk;
initial begin
$monitor("Time=%d F=%d",$time,F);
end
endmodule

module pipe(A,B,C,D,clk,F);
parameter N=10;
input[N-1:0]A,B,C,D;
input clk;
output[N-1:0]F;
reg[N-1:0]L12_x1,L12_x2,L12_D,L23_x3,L23_D,L34_F;
always @(posedge clk)
begin
L12_x1 <= #4 A + B;
L12_x2 <= #4 C - D;
L12_D <= D;

L23_x3 <= #4 L12_x1 + L12_x2;
L23_D <= L12_D;

L34_F <=#6 L23_x3 * L23_D;
end
assign F=L34_F;
endmodule


