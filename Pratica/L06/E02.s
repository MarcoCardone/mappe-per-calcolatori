.equ '\n' 0x0a
.equ '*' 0x2a
.equ '-0' -48
.data
IN_msg: .string "Inserisci la dimensione dell lato (0-9): "
buffer: .zero 1
.text
main:
    li a7 4
    la a0 IN_msg
    ecall

    li a7 63
    li a0 0 
    la a1 buffer
    li a2 1
    ecall
    
    lw t0 0(a1)
    addi t0 t0 '-0' 
    
    mv a0 t0
    jal stampaTriangolo 
    mv a0 t0
    jal stampaQuadrato

    j fine
    
    
stampaTriangolo:
    li a7 11
    mv s11 a0
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
    mv s11 a0
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
