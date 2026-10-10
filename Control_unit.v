`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2026 17:11:39
// Design Name: 
// Module Name: Control_unit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module main_control( //control unit comprises of main and alu_control unit
input [6:0] opcode,
output reg reg_write,
output reg mem_read,
output reg mem_write,
output reg alu_src,
output reg mem_to_reg,
output reg branch,
output reg jump,
output reg [1:0]alu_op,
output reg[2:0]imm_sel
);
localparam R_TYPE = 7'b0110011;
localparam I_TYPE = 7'b0010011;
localparam LOAD   = 7'b0000011;
localparam STORE  = 7'b0100011;
localparam BRANCH = 7'b1100011;
localparam JAL    = 7'b1101111;

always @(*)
begin
 reg_write = 0;
 mem_write = 0;
 alu_src = 0;
 mem_to_reg = 0;
 branch = 0;
 jump = 0;
 mem_read = 0;
 alu_op = 2'd0;
 imm_sel = 3'd0;

case(opcode)
  R_TYPE: begin
        reg_write = 1'b1;
        mem_read = 1'b0;
        alu_op =2'b10;
        end
  I_TYPE:begin
         reg_write = 1'b1;
         imm_sel = 3'd0;
         alu_op = 2'b11;
         alu_src = 1'b1;
         end
   LOAD: begin
         reg_write = 1'b1;
         mem_to_reg = 1'b1;
         mem_read = 1'b1;
         alu_src = 1'b1;
         alu_op = 2'b00;
         end
   STORE: begin
         mem_write = 1'b1;
         alu_src = 1'b1;
         imm_sel = 3'b001;
         alu_op =2'b00;
         end
   BRANCH : begin
         branch = 1'b1;
         imm_sel =3'b010;
         alu_op = 2'b01;
         end
   JAL:  begin
         jump = 1'b1;
         reg_write =1;
         imm_sel = 3'b100;
         end
   
   default: begin
    reg_write = 0;
    mem_write = 0;
    alu_src = 0;
    mem_to_reg = 0;
    branch = 0;
    jump = 0;
    mem_read = 0;
    alu_op = 2'd0;
   imm_sel = 3'd0;
   end

   endcase
  end
 
endmodule


