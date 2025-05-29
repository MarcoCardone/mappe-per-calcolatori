.equ '\n' 0x0a
.equ '0' 0x30

.data
bigNum: .word 3141592653

.text
main:
    lw t0 bigNum
    
    li a7 1
    mv a0 t0
    ecall
    
    
    li s10 10
    addi sp sp -4
    sw sp 0(sp)
    
    pushing_all:beq t0 zero pushing_done
        addi sp sp -4
        remu t1 t0 s10
        divu t0 t0 s10
        sw t1 0(sp)
        j pushing_all
    pushing_done:
        
    li a7 11
    li a0 '\n'
    ecall
    
    lw t0 0(sp)
    poping_all: beq t0 sp poping_done
        li a7 11
        addi a0 t0 '0'
        ecall  
        addi sp sp +4    
        lw t0 0(sp)
        j poping_all
    poping_done: 
    addi sp sp +4 
    
    li a7 11
    li a0 '\n'
    ecall
    j fine
        
fine:
    li a7 10
    ecall
