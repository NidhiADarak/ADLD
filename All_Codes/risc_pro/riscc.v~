module risc_pro(clk1,clk2);
input     clk1,clk2;                            //Two phase clock
reg[31:0] pc,if_id_ir,if_id_npc;
reg[31:0] id_ex_ir,id_ex_npc,id_ex_a,id_ex_b,id_ex_imm;
reg[2:0]  id_ex_type,ex_mem_type,mem_wb_type;
reg[31:0] ex_mem_ir,ex_mem_aluout,ex_mem_b;
reg       ex_mem_cond;
reg[31:0] mem_wb_ir,mem_wb_aluout,mem_wb_lmd;

reg[31:0] Reg [0:31];
reg[31:0] Mem [0:1023];

parameter ADD=6'b000000, SUB=6'b000001, AND=6'b000010, OR=6'b000011, SLT=6'b000100, MUL=6'b000101, HLT=6'b111111, 
      LW=6'b001000,SW=6'b001001, ADDI=6'b001010, SUBI=6'b001011, SLTI=6'b001100, BNEQZ=6'b001101, BEQZ=6'b001110;
parameter RR_ALU=3'b000,RM_ALU=3'b001,LOAD=3'b010,STORE=3'b011,BRANCH=3'b100,HALT=3'b101; 

reg halted;
reg taken_branch;

always @(posedge clk1)
if(halted==0)
begin 
if(((ex_mem_ir[31:26]==BEQZ)&&(ex_mem_cond==1)) || ((ex_mem_ir[31:26]==BNEQZ)&&(ex_mem_cond==0)))
begin
if_id_ir <= #2 Mem[ex_mem_aluout];
taken_branch <= #2 1'b1;
if_id_npc <= #2 ex_mem_aluout+1;
pc <= #2 ex_mem_aluout+1;
end
else
begin
if_id_ir <= #2 Mem[pc];
if_id_npc <= #2 pc+1;
pc <= #2 pc+1;
end
end

always @(posedge clk2)
if (halted==0)
begin
if(if_id_ir[25:21]==5'b00000) 
id_ex_a<=0;
else 
id_ex_a <= #2 Reg[if_id_ir[25:21]];  //rs

if(if_id_ir[20:16]==5'b00000) 
id_ex_b<=0;
else 
id_ex_b <= #2 Reg[if_id_ir[20:16]]; //rt

id_ex_npc <= #2 if_id_npc;
id_ex_ir <= #2 if_id_ir;
id_ex_imm <= #2 {{16{if_id_ir[15]}}, {if_id_ir[15:0]}};

case(if_id_ir[31:26])
 ADD,SUB,AND,OR,SLT,MUL: id_ex_type <= #2 RR_ALU;
 ADDI,SUBI,SLTI        : id_ex_type <= #2 RM_ALU;
 LW                    : id_ex_type <= #2 LOAD;
 SW                    : id_ex_type <= #2 STORE;
 BNEQZ,BEQZ            : id_ex_type <= #2 BRANCH;
 HLT                   : id_ex_type <= #2 HALT;
 default               : id_ex_type <= #2 HALT;
endcase
end

always @(posedge clk1)
if (halted==0)
begin
ex_mem_type<= #2 id_ex_type;
ex_mem_ir<= #2 id_ex_ir;
taken_branch<= #2 0;


case(id_ex_type)
RR_ALU: begin
        case(id_ex_ir[31:26])
        ADD: ex_mem_aluout <= id_ex_a + id_ex_b;
        SUB: ex_mem_aluout <= id_ex_a - id_ex_b;
        AND: ex_mem_aluout <= id_ex_a & id_ex_b;
        OR : ex_mem_aluout <= id_ex_a | id_ex_b;
        SLT: ex_mem_aluout <= id_ex_a < id_ex_b;
        MUL: ex_mem_aluout <= id_ex_a * id_ex_b;
        default: ex_mem_aluout <= 32'hxxxxxxxx;
        endcase
end

RM_ALU: begin
        case(id_ex_ir[31:26])
        ADDI: ex_mem_aluout <= #2 id_ex_a + id_ex_imm;
        SUBI: ex_mem_aluout <= #2 id_ex_a - id_ex_imm;
        SLTI: ex_mem_aluout <= #2 id_ex_a < id_ex_imm;
        default: ex_mem_aluout <= 32'hxxxxxxxx;
        endcase
end

LOAD, STORE: begin
             ex_mem_aluout <= #2 id_ex_a + id_ex_imm;
             ex_mem_b <= #2 id_ex_b;
             end

BRANCH: begin
        ex_mem_aluout <= #2 id_ex_npc + id_ex_imm;
        ex_mem_b <= #2 (id_ex_a==0);
        end
endcase
end

always @(posedge clk2)
if(halted==0)
begin
mem_wb_type <= ex_mem_type;
mem_wb_ir <= #2 ex_mem_ir;

case(ex_mem_type)
RR_ALU,RM_ALU : mem_wb_aluout <= #2 ex_mem_aluout;
LOAD: mem_wb_lmd <= #2 Mem[ex_mem_aluout];
STORE: if(taken_branch==0)
       Mem[ex_mem_aluout] <= #2 ex_mem_b;
endcase
end

always @(posedge clk1)
begin
if(taken_branch==0)
case(mem_wb_type)
RR_ALU: Reg[mem_wb_ir[15:11]] <= #2 mem_wb_aluout;
RM_ALU: Reg[mem_wb_ir[20:16]] <= #2 mem_wb_aluout;
LOAD:  Reg[mem_wb_ir[20:16]] <= #2 mem_wb_lmd;
HALT: halted <= #2 1'b1;
endcase
end
endmodule





 



   
