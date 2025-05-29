.equ NUMCOL 6
.equ NUMRIG 4
.equ DIMRIG 24

.data
TAB: .word 154, 123,  109,  86,   4, 0
     .word 412, -23, -231,   9,  50, 0
     .word 123, -24,   12,  55, -45, 0
     .word   0,   0,    0,   0,   0, 0
.text
main:
    la t0 TAB
    
    li a3 0
    li t1 NUMCOL
    addi t1 t1 -1
    
    for_1:beq a3 t1 fdone_1
        mv a0 t0
        li a1 NUMRIG
        li a2 NUMCOL
        
        jal SUM_FIXED_COL
        
        addi a3 a3 1
        j for_1
    fdone_1:
        
    li a3 0
    li t1 NUMRIG
    for_2:beq a3 t1 fdone_2
        mv a0 t0
        li a1 NUMRIG
        li a2 NUMCOL
        jal SUM_FIXED_ROW
        addi a3 a3 1
        j for_2
    fdone_2:
    j fine
    
SUM_FIXED_COL:
    li s0 0 # tot
    li s1 0 #i
    li s2 0 #offset
     
    # T = T+k*4
    slli a3 a3 2
    add a0 a0 a3
    
    # R-1
    addi a1 a1 -1
    while_1:beq s1 a1 wdone_1
        add s3 a0 s2
        lw s4 0(s3)
        add s0 s0 s4
    
        addi s1 s1 1
        addi s2 s2 DIMRIG
        
        j while_1
    wdone_1:
    add a0 a0 s2
    sw s0 0(a0)
    srli a3 a3 2
    jr ra

SUM_FIXED_ROW:
    li s0 0 #tot
    li s1 0 #i
    
    li s2 DIMRIG
    mul s2 a3 s2
    add a0 a0 s2 # T = T*C*4*k*
    addi a2 a2 -1 # C-1
    while_2:beq s1 a2 wdone_2
        lw s3 0(a0)
        add s0 s0 s3
        addi s1 s1 +1
        addi a0 a0 +4
        j while_2
    wdone_2:
    sw s0 0(a0)
    jr ra
    
fine:
    li a7 10
    ecall
