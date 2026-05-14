# RV32I Single Cycle Processor Implementation on Basys3 FPGA
A complete 32-bit RV32I RISC-V processor designed and implemented in Verilog HDL featuring modular RTL architecture, functional simulation, and FPGA deployment on the Basys3 FPGA board. The processor supports core RV32I instructions and was successfully verified through the execution of custom assembly programs on real FPGA hardware.

The implementation demonstrates correct instruction fetch, decoding, ALU computation, register file operations, memory access, branching, and program control flow. To improve hardware visualization and debugging, the design includes binary-to-BCD conversion, multiplexed seven-segment display interfacing, and real-time output monitoring on the FPGA board.

A clock divider module is integrated to reduce the Basys3 100 MHz system clock to a slower frequency, enabling visible step-by-step execution of instructions and easier verification of processor behavior on hardware. The complete processor was fully simulated, synthesized, implemented, and successfully tested on FPGA hardware.



# Project Overview
This project implements a single-cycle 32-bit RISC-V processor based on the RV32I base integer instruction set architecture. The design contains all essential datapath and control modules required for instruction fetch, decode, execution, memory access, and write-back stages.
The processor was:
- Designed using Verilog HDL
- Simulated and verified using Icarus Verilog and GTKWave
- Synthesized and implemented using Xilinx Vivado
- Deployed and tested on the Basys3 FPGA board
- Verified using custom assembly programs for processor functionality
- Integrated with seven-segment display hardware for real-time output visualization
The processor supports arithmetic, logical, memory, branch, and jump instructions, demonstrating proper datapath operation and control signal generation during execution.



# Key Features
- 32-bit RV32I RISC-V processor implementation
- Single-cycle processor architecture
- Support for:
  - R-Type instructions
  - I-Type instructions
  - S-Type instructions
  - B-Type instructions
  - U-Type instructions
  - J-Type instructions
- Modular RTL design using Verilog HDL
- Separate RTL modules including:
  - Program Counter
  - Instruction Fetch Unit
  - Instruction Decode Unit
  - Control Unit
  - Register File
  - Immediate Generator
  - ALU Control Unit
  - Memory Access Unit
  - Write Back Unit
  - PC Next Logic
  - Top Processor Module
- ALU support for arithmetic and logical operations
- Clock divider for Basys3 100 MHz system clock
- Binary-to-BCD conversion module
- Multiplexed display controller
- Seven-segment display interfacing
- Real-time FPGA output visualization
- Functional verification using assembly test programs
- Complete simulation testbench support
- XDC constraint file for Basys3 FPGA board
- Successfully synthesized and deployed on FPGA hardware
