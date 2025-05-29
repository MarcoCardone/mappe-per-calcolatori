.equ DIM 10
.data
wVettor: .word 75,31,24,44,20,67,95,39,94,53
OUT: .string "\nIl numero piu' grande uscito e' "
.text
main:
    la a0 wVettor
    li a1 DIM
    
    jal findMax
    
    mv t0 a0
    
    li a7 4
    la a0 OUT
    ecall
    
    li a7 1
    mv a0 t0
    ecall
    j fine
    
findMax:
    lui s0 0x80000
    li s2 0
    fM_for: beq s2 a1 fM_done
        lw s1 0(a0)
        bge s0 s1 go_ahead
        mv s0 s1
        go_ahead:
        addi s2 s2 1
        addi a0 a0 4
        j fM_for 
    fM_done:    
    mv a0 s0
    jr ra
fine:
    li a7 10
    ecall
    
