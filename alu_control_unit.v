`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2026 20:35:58
// Design Name: 
// Module Name: alu_control_unit
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


module alu_control_unit(
input [1:0]alu_op,
input [2:0]funct3,
input [6:0]funct7,
output reg [3:0]alu_control);

always @(*)
begin
  case(alu_op)
  2'b00 :begin
        alu_control = 4'b0000;
        end
  2'b01 : begin
          alu_control = 4'b0001;
          end
  2'b10 : begin
          case(funct3)
          3'b000: begin
                if(funct7 == 7'b0000000)
                     alu_control = 4'b0000;
                else if(funct7 == 7'b0100000)
                     alu_control = 4'b0001;
                else
                     alu_control = 4'b0000;
               end
 
           3'b001: alu_control = 4'b0101;
           3'b010: alu_control = 4'b1000;
           3'b011: alu_control = 4'b1001;
           3'b100: alu_control = 4'b0100;
           3'b101: begin
               if(funct7 == 7'b0000000)
                      alu_control = 4'b0110;
                   else if(funct7 == 7'b0100000)
                      alu_control = 4'b0111;
                    else
                      alu_control = 4'b0000;
                  end
           3'b110: alu_control = 4'b0011; 
           3'b111: alu_control = 4'b0010;
           default:
           alu_control = 4'b0000;
         endcase
         end
  2'b11 : begin
    case(funct3)
     3'b000 : alu_control = 4'b0000;
     3'b111 : alu_control = 4'b0010;
     3'b110 : alu_control = 4'b0011;
     3'b100 : alu_control = 4'b0100;
     3'b001 : alu_control = 4'b0101;     
     3'b101:
     begin
       if(funct7 == 7'b0000000)
         alu_control = 4'b0110;
      else if(funct7 == 7'b0100000)
         alu_control = 4'b0111;
      else
          alu_control = 4'b0000;
     end
     
     3'b010 : alu_control = 4'b1000;
     3'b011 : alu_control = 4'b1001;
     
     default: alu_control = 4'b0000;
   endcase
   end
 
 default:
    alu_control = 4'b0000;
  endcase
end
endmodule
