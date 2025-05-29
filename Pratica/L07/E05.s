.data

matrice: .word 1, 41, 42, 13, 56, 23, 73, 9, 50
.text
main:
    la t0 matrice 
    lw a0 00(t0) 
    lw a1 04(t0)
    lw a2 08(t0)
    lw a3 12(t0)
    lw a4 16(t0)
    lw a5 20(t0)
    lw a6 24(t0)
    lw a7 28(t0)
    lw t1 32(t0)
    addi sp sp -4 
    sw t1 0(sp)
    jal determinante3x3
    addi sp sp 4
    
    
    li a7 1
    ecall
    j fine 
    
    
determinante3x3:
    addi sp sp -20
    sw ra 0(sp)
    sw s0 4(sp)
    sw s1 8(sp)
    sw s2 12(sp)
    sw s3 16(sp)
    
    mv s0 a0
    mv s1 a1
    mv s2 a2
    mv s3 a3
    
    mv a0 a4 
    mv a1 a5
    mv a2 a7
    lw a3 20(sp)
    
    jal determinante2x2
    mul s0 s0 a0
    
    mv a0 s3
    mv a1 a5
    mv a2 a6
    lw a3 20(sp)
    jal determinante2x2
    mul s1 s1 a0
    
    mv a0 s3
    mv a1 a4
    mv a2 a6
    mv a3 a7
    
    jal determinante2x2
    mul s2 s2 a0    
    
    sub s0 s0 s1
    add s0 s0 s2
    
    mv a0 s0
    
    lw ra 0(sp)
    lw s0 4(sp)
    lw s1 8(sp)
    lw s2 12(sp)
    lw s3 16(sp)
    
     jr ra

determinante2x2:
    mul a0 a0 a3
    mul a1 a1 a2
    sub a0 a0 a1
    jr ra
    
fine:
    li a7 10 
    ecall
