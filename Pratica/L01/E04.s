.data
var:  .word 0x3ffffff0
mes: .string "\n"
.text
main:
    lw,t1,var
    slli t1,t1,1
    
    li a7,1
    mv a0,t1
    ecall
    
    li a7,4
    la a0,mes
    ecall
    
    li a7,1
    addi a0,t1,40
    ecall
    
fine:
    li a7,10
    ecall
    
