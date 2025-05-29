.equ '\n' 0x0a
.equ '*' 0x2a
.text
main:
    jal stampaTriangolo 
    jal stampaQuadrato
    
    j fine
    
    
stampaTriangolo:
    li a7 11
    li s11 8
    li s0 0
    sT_for_1: beq s0 s11 sT_done_1
        li s1 -1
        sT_for_2:beq s1 s0 sT_done_2
            li a0 '*'
            ecall
            addi s1 s1 1
            j sT_for_2
        sT_done_2:
        li a0 '\n'
        ecall  
        addi s0 s0 1
        j sT_for_1
    sT_done_1:
    li a0 '\n'
    ecall  
    jr ra
    
    
stampaQuadrato:
    li a7 11
    li s11 8
    li s0 0
    sQ_for_1: beq s0 s11 sQ_done_1
        li s1 0
        sQ_for_2:beq s1 s11 sQ_done_2
            li a0 '*'
            ecall
            addi s1 s1 1
            j sQ_for_2
        sQ_done_2:
        li a0 '\n'
        ecall  
        addi s0 s0 1
        j sQ_for_1
    sQ_done_1:
    li a0 '\n'
    ecall  
    jr ra

fine:
    li a7 10 
    ecall
