.data

matrice: .word 1 0 
         .word 0 1
.text
main:
    la t0 matrice 
    lw a0 0(t0) #a
    lw a1 4(t0) #b
    lw a2 8(t0) #c
    lw a3 12(t0) #d
    jal determinante2x2
    
    j fine 

determinante2x2:
    mul a0 a0 a3
    mul a1 a1 a2
    sub a0 a0 a1
    jr ra
    
fine:
    li a7 10 
    ecall
