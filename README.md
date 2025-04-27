# verilog
This repository contains a collection of Verilog codes for digital design and hardware description. The implementations include various modules, such as sequential and combinational circuits, finite state machines (FSMs), RISC architectures, and other key components in digital logic design.
##16-bit RISC Processor (Verilog Project)
📚 Project Overview
This project implements a 16-bit RISC Processor based on Harvard Architecture using Verilog HDL.
The processor is designed for simplicity, modularity, and high efficiency — making it suitable for educational, embedded, and low-power applications.

Developed by
G. Krishna Sai (R200506)
Under the guidance of Mr. Y. Arun Kumar Reddy, Assistant Professor, RGUKT RK Valley.

✨ Features
Simple Reduced Instruction Set Computing (RISC) Architecture.

![image](https://github.com/user-attachments/assets/d322fc6a-d7d8-43c7-8e3f-2edd946a375c)


Harvard Memory Model (separate instruction and data memory).

Supports key instruction types: R-type, I-type, S-type, B-type, U-type.
Modular Verilog HDL design.
Testbenches for all major modules.
Designed for power efficiency and high performance.
🏛️ Processor Architecture
Core Components:

Program Counter (PC)
Instruction Memory
Data Memory
Register File
Arithmetic Logic Unit (ALU)
Control Unit
Instruction Decoder
Instruction Types Supported:

R-Type (Register operations)
I-Type (Immediate operations)
S-Type (Store instructions)
B-Type (Branch instructions)
U-Type (Upper Immediate instructions)

🛠️ Source Modules

Module Name	Description
alu.v	Arithmetic Logic Unit (supports ADD, SUB, OR, AND, XOR, NOT, CMP, SHL, SHR, JMP)
control_unit.v	FSM for managing processor stages
decoder.v	Instruction decoder to extract opcode, operands, and immediate values
fake_ram.v	Behavioral model for instruction and data memory
pc_unit.v	Program Counter update logic
reg_file.v	Register file for storing operands and results
🧪 Testbenches

decoder_tb.v: Testbench for instruction decoder.
reg_file_tb.v: Testbench for register file.
main_tb.v: Full system testbench integrating all modules.
⚙️ How to Run

Clone the repository.
Simulate the Verilog files using any simulator (ModelSim, Vivado, etc.).
Run the individual testbenches first.
Finally, run the main_tb.v to test the full processor pipeline.

![Uploading image.png…]()


📈 Applications
Embedded Systems (IoT devices, Smart Home, Medical devices)
Consumer Electronics (Smart appliances, Educational kits)
Industrial Automation (Motor Controllers, Sensor Systems)
Communication Systems (Wireless, Bluetooth, Zigbee)

📋 Conclusion
This project proves that a minimalistic RISC-V inspired 16-bit processor can be efficiently designed with Verilog HDL.
It offers a great foundation for future advancements like pipelining, cache integration, and custom instruction extensions.
