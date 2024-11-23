# 2-Stage-Pipeline-4bit-CPU

## Overview  

This project implements a 2-Stage Pipeline 4-bit CPU designed to execute simple instructions efficiently. The CPU architecture follows a two-stage pipeline:  

1. Instruction Fetch (IF)  
2. Execute (EX)  

## ISA

- Instruction Width: 8bit  
- Opcode: 4bit  
- Operand: 4bit 
<img src = "https://github.com/nk12U/2-Stage-Pipeline-4bit-CPU/blob/main/ISA.jpg"> 

## Operationg Environment

- FPGA: Altera Cyclone IV  
- [Quartus Prime Lite 23.1.1](https://www.intel.com/content/www/us/en/software-kit/825278/intel-quartus-prime-lite-edition-design-software-version-23-1-1-for-windows.html)
- [ModelSim 20.1.1](https://www.intel.com/content/www/us/en/software-kit/660907/intel-quartus-prime-lite-edition-design-software-version-20-1-1-for-windows.html)
- [VSCode](https://code.visualstudio.com/)

## RTL Hierarchy

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

## Syllabus

[Advanced Practice of Electrical and Electronic Engineering](https://www.k.kyoto-u.ac.jp/external/open_syllabus/department_syllabus?lectureNo=12006&departmentNo=16)
