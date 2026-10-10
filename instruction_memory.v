`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2026 07:03:41
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory(
input [31:0]pc,
output [31:0]instruction
    );
    
 reg [31:0]instruction_memory[0:255];
 initial
 begin
 $readmemh("program.mem" , instruction_memory);
 end
 
 assign instruction = instruction_memory[pc>>2];
 
endmodule
