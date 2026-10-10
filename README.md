32-bit Single-Cycle RISC-V Processor

Overview
A 32-bit single-cycle RISC-V processor designed using Verilog HDL and Xilinx Vivado.

The design integrates the datapath and control components required to fetch, decode, and execute supported instructions.

Architecture
- Program Counter
- Instruction Memory
- Register File
- Immediate Generator
- Main Control Unit
- ALU Control Unit
- Arithmetic Logic Unit (ALU)
- Data Memory
- Top-Level Processor

Repository Structure
- rtl/ — Verilog source modules
- constraints/ — FPGA pin and timing constraints
- test_programs/ — Machine-code test programs
- program.mem — Instruction memory initialization file

 Tools
- Verilog HDL
- Xilinx Vivado
- FPGA implementation

 Verification
Test programs are included for checking the ADDI instruction with positive and negative immediate values. Additional instruction-level verification can be documented as testing progresses.

Future Improvements
- Expand instruction coverage
- Add automated testbenches
- Document simulation and FPGA verification results
- Extend the processor with pipelining
