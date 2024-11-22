# 2-Stage-Pipeline-4bit-CPU

## Overview  

This project implements a 2-Stage Pipeline 4-bit CPU designed to execute simple instructions efficiently. The CPU architecture follows a two-stage pipeline:  

1. Instruction Fetch (IF)  
2. Execute (EX)  

## ISA

Refer to the ISA.jpg to understand the instructions that the CPU can execute.  
<img src = "https://github.com/nk12U/2-Stage-Pipeline-4bit-CPU/blob/main/ISA.jpg">

- Instruction Width: 8bit  
- Opcode: 4bit  
- Operand: 4bit  

## Operationg Environment

- FPGA: Altera Cyclone IV  
- Quartus Prime Lite 23.1std  
- ModelSim 19.1
- VSCode

### Extended  

- CPU
  - ALU
    - alu_ctrl
    - full_adder
    - multiplier_4x4
    - demux
    - gpr_mux_load
    - register
    - register16
    - mux4x2
    - mux4x4
    - mux4x16
  - PCU
    - pc_ctrl
    - counter
  - instruction_register
    - register

### Vanilla

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
