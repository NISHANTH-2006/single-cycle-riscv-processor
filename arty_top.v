`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2026 13:41:17
// Design Name: 
// Module Name: arty_top
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


module arty_top(
input clk,
input rst,
output [3:0]led
    );
    
//wire cpu_clk;
wire [31:0]pc;
wire [31:0]instruction;
wire [31:0]alu_result;
//wire [31:0]read_data1;
//wire [31:0]read_data2;
wire [31:0]write_back_data;
wire  reg_write;
/*clock_divider divider(
 .clk_in(clk),
 .rst(rst),
 .clk_out(cpu_clk));*/
    
risc_v_processor CPU(
.clk(clk),
.rst(rst),
.pc(pc),
.instruction(instruction),
.alu_result(alu_result),
.reg_write(reg_write),
.write_back_data(write_back_data)
//.write_back_data(write_back_data),
//.reg_write(reg_write)
);



ila_1 ila_inst(
	.clk(clk), // input wire clk


	.probe0(pc), // input wire [31:0]  probe0  
	.probe1(instruction), // input wire [31:0]  probe1 
	.probe2(alu_result), // input wire [31:0]  probe2 
	.probe3(reg_write), // input wire [31:0]  probe3 
	.probe4(write_back_data) // input wire [31:0]  probe4 
	// input wire [0:0]  probe6
);

assign led = pc[5:2];
 
endmodule
