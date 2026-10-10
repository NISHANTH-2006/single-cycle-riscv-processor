`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2026 22:42:37
// Design Name: 
// Module Name: risc_v_processor
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


module risc_v_processor(
input clk,
input rst,
output [31:0]pc,
output [31:0]instruction,
output [31:0]alu_result,
output [31:0]read_data1,
output [31:0]read_data2,
output [31:0]write_back_data,
output reg_write
    );
  //progeam counter
 wire [31:0]pc_next;
 
 //register file
 wire [31:0]immediate;
 
 //alu (arithmetic and logic unit)
 wire zero;
 wire carry;
 wire overflow;
 wire negative;
 
 //main control unit
 wire [31:0]memory_data;
 wire mem_read;
 wire mem_write;
 wire alu_src;
 wire mem_to_reg;
 wire branch;
 wire jump;
 wire [1:0]alu_op;
 wire[2:0]imm_sel;
 
 //alu  control unit
 wire [3:0]alu_control;
 
 //alu input multiplexer
 wire [31:0]alu_input_B;
 assign alu_input_B = (alu_src) ? immediate : read_data2;
 
 //instruction separation
 wire [6:0]opcode;
 wire [2:0]funct3;
 wire [6:0]funct7;
 wire [4:0]rs1;
 wire [4:0]rs2;
 wire [4:0]rd;
 
 assign opcode = instruction[6:0];
 assign funct3 = instruction[14:12];
 assign funct7 = instruction[31:25];
 assign rs1    = instruction[19:15];
 assign rs2    = instruction[24:20];
 assign rd     = instruction[11:7];
 
 //mux selecting the write back data either memory_data or alu_result
 assign write_back_data = (mem_to_reg) ? memory_data : alu_result;
 
 //pc logic -> 3 WAY MULTIPLEXER
 wire halt;
 assign halt = (instruction == 32'h00000000);
  assign pc_next = halt ? pc : (branch && zero) ? (pc + immediate) : (pc + 32'd4);
  
  //program counter instantiation
  program_counter pc_inst( .clk(clk) , .rst(rst) , .pc_next(pc_next) , .pc(pc) );
 
 //instruction memory instantiation
  instruction_memory im_inst( .pc(pc) , .instruction(instruction) );
 
 //main control unit instantiation
  main_control control_inst(
  .opcode(instruction[6:0]),
  .reg_write(reg_write),
  .mem_read(mem_read),
  .mem_write(mem_write),
  .alu_src(alu_src),
  .mem_to_reg(mem_to_reg),
  .branch(branch),
  .jump(jump),
  .alu_op(alu_op),
  .imm_sel(imm_sel));
  
  //immediate generator instantiation
  
  Immediate_generator imm_gen(
  .instruction(instruction),
  .imm_sel(imm_sel),
  .immediate(immediate));
  
  //register file instantiation
  
  register_file reg_files(
  .clk(clk) ,
  .rst(rst),
  .reg_write(reg_write),
  .write_data(write_back_data),
  .rs1(rs1),
  .rs2(rs2),
  .rd(rd),
  .read_data1(read_data1),
  .read_data2(read_data2));
  
  
  //alu control unit instantiation
  
  alu_control_unit alt_ctrl(
    .alu_op(alu_op),
    .funct3(funct3),
    .funct7(funct7),
    .alu_control(alu_control));
    
    //alu instantiation
    
    ALU alu_inst(
    .A(read_data1),
    .B(alu_input_B),
    .alu_control(alu_control),
    .result(alu_result),
    .zero(zero),
    .carry(carry),
    .overflow(overflow),
    .negative(negative));
    
    // data memory instantiation
    
    data_memory data_mem(
    .clk(clk),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .address(alu_result),
    .write_data(read_data2),
    .read_data(memory_data));
    
endmodule
