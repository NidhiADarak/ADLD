module park_car(fs,bs,clock,password,no_car,car_entered,enter_password,pass_matched,car_parked);
input clock;
input fs,bs;
input [3:0]password;
reg ack=0;
output  reg no_car,car_entered,enter_password,pass_matched,car_parked;

always @(posedge clock)
begin
if(fs==0)
begin
no_car <= #1 1'b1;
ack <= #1 1'b0;
end
else
no_car <= #1 1'b0;
end

always @(posedge clock)
begin
if(fs==1)
begin
car_entered <= #1 1'b1;
ack <= #1 1'b0;
end
else
car_entered <= #1 1'b0;
end

always @(posedge clock)
begin
if(fs==1)
begin
enter_password <= #1 1'b1;
end
else
enter_password  <= #1 1'b0;
end

always @(posedge clock)
begin
if(enter_password == 1)
if(password==4'b1111)
pass_matched <= #1 1'b1;
else
pass_matched <= #1 1'b0;
end

always @(posedge clock)
begin
if(pass_matched)
if(bs==1)begin
car_parked <= #1 1'b1;
ack <= #20 1'b1;
end
else
car_parked <= #1 1'b0;
end

always @(posedge clock)
begin
if(ack)begin
car_entered <= #1 1'b0;
pass_matched <= #1 1'b0;
car_parked <= #1 1'b0;
end
end
endmodule

