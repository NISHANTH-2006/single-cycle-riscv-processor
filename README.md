32-bit Single-Cycle RISC-V Processor

Overview
This project implements a 32-bit single-cycle RISC-V processor using Verilog HDL and Xilinx Vivado. The design integrates the major datapath and control components required to fetch, decode, and execute instructions.

Architecture
The processor includes the following modules:
- Program Counter (PC)
- Instruction Memory
- Register File
- Immediate Generator
- Main Control Unit
- ALU Control Unit
- Arithmetic Logic Unit (ALU)
- Data Memory
- Top-Level Processor Module

Tools and Technologies
- HDL: Verilog
- Design and Implementation:Xilinx Vivado
- Target Hardware: FPGA (board-specific constraints included where applicable)

Repository Structure
- Verilog source files for processor modules
- program.mem — instruction memory initialization
- FPGA constraints file (.xdc)

Verification
The design has been tested using Vivado and on FPGA hardware. Further instruction-level verification and extensions can be documented as development progresses.

## Future Improvements
- Expand instruction support
- Add automated testbenches
- Implement a pipelined processor architecture
- Improve debugging and verification coverage
