# 2-Stage-Pipeline-4bit-CPU

## Overview  
This project implements a 2-Stage Pipeline 4-bit CPU designed to execute simple instructions efficiently. The CPU architecture follows a two-stage pipeline:  

1. Instruction Fetch (IF)  
2. Execute (EX)  

Refer to the ISA.png to understand the instructions that the CPU can execute.  

Instruction Width: 8bit  
Opcode: 4bit  
Operand: 4bit  

- CPU
  - ALU
    - alu_ctrl
    - full_adder
    - demux
    - gpr_mux_load
    - register
    - register16
    - mux4x2
    - mux4x4
    - mux4x16
  - PCU
    - pc_ctrl
    - register
    - counter
