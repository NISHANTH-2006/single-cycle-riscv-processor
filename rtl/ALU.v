`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2026 09:16:58
// Design Name: 
// Module Name: ALU
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


module ALU(
input [31:0]A,
input [31:0]B,
input [3:0] alu_control,
output reg[31:0]result,
output reg zero,
output reg carry,
output reg overflow,
output reg negative );

reg [32:0]temp;
always @(*)
begin
 carry = 1'b0;
 overflow = 1'b0;
case(alu_control)

   4'd0 : begin
            temp = {1'b0,A} + {1'b0,B};
            result = temp[31:0];
            carry = temp[32];
            overflow =(~(A[31]^B[31]) & (A[31] ^ result[31]));
            end
       
   4'd1 : begin
          temp = {1'b0,A} - {1'b0 ,B};
          result = temp[31:0];
          carry = temp[32];
          overflow = (A[31] ^ B[31]) & ( A[31] ^ result[31]);
          end
          
   4'd2 :  result = A & B;
         
   4'd3 :  result = A | B;
         
   4'd4 :  result = A ^ B;
          
   4'd5 :  result = A << B[4:0];
          
   4'd6 :  result = A >> B[4:0];
    
   4'd7 :  result = $signed(A) >>> B[4:0];
       
   4'd8 :  result = ($signed(A) < $signed(B))?32'd1 : 32'd0;
 
   4'd9 :  result = A < B ? 32'd1 :32'd0;
        
  default : result = 32'd0;
   
endcase
   zero = (result == 32'd0);
   negative = result[31];
  
end
endmodule
