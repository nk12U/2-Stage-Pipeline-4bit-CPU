# 2-Stage-Pipeline-4bit-CPU
 
`Pipeline: IF -> EX`  

Please refer ISA.png, then you can understand Instructions which the CPU executes.  

Instruction Width: 8bit  
Opcode: 4bit  
Operand: 4bit  

- CPU
  - ALU
    - alu_ctrl
    - mux4x4
    - full_adder
    - demux
    - gpr_mux_load
    - register16
    - mux4x16
    - mux4x2
    - register
  - PCU
    - pc_ctrl
    - pc_ctrl
    - counter