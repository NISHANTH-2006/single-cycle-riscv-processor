`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2026 21:26:07
// Design Name: 
// Module Name: data_memory
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


module data_memory(
input clk,
input mem_read,
input mem_write,
input [31:0]address,
input [31:0]write_data,
output reg[31:0]read_data);

reg [31:0]data_memory[0:255];

always @(posedge clk)
  begin
  if(mem_write)
     data_memory[address[9:2]] <= write_data; //thumb rule : memory[address[N+1:2]]
// data_memory[address>>2] <= write_data also valid.. 
  end

always @(*)
 begin
   if(mem_read)
     read_data = data_memory[address>>2];
   else
     read_data = 32'd0;
 end
 
endmodule
