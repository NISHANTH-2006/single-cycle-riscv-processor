`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2026 12:48:24
// Design Name: 
// Module Name: Immediate_generator
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


module Immediate_generator(
input [31:0]instruction,
input [2:0]imm_sel,
output reg[31:0]immediate
);
always @(*)
begin
 case(imm_sel)
  3'd0: immediate = {{20{instruction[31]}},instruction[31:20]};
  3'd1: immediate = {{20{instruction[31]}},instruction[31:25] ,instruction[11:7]};
  3'd2: immediate = {{19{instruction[31]}},instruction[31] ,instruction[7] , instruction[30:25],instruction[11:8],1'b0};
  3'd3: immediate = {instruction[31:12], 12'b0};
  3'd4: immediate = {{11{instruction[31]}},instruction[31],instruction[19:12] ,instruction[20],instruction[30:21],1'b0};
  default: immediate = 32'd0;
  endcase
  end
endmodule
