.data
next: .string   " -> "
endl: .string "\n"
message_1: .string "Da "
message_2: .string " si ottiene una seguenza di cardinalita : "
.text
main:
    li a0  19
    add t0 a0 zero
    jal sequenzaDiCollatz
    add t1 a0 zero
    
    li a7 4
    la a0 message_1
    ecall
    
    li a7 1
    mv a0 t0
    ecall
    
    li a7 4
    la a0 message_2
    ecall
    
    li a7 1
    mv a0 t1
    ecall
    
    
    
    
    li a7 10 
    ecall
sequenzaDiCollatz:
    li s0 1
    li s1 1
    addi sp sp -4
    sw ra 0(sp)
    for:beq a0 s1 fine
        li a7 1
        ecall
        
        mv s2 a0
        li a7 4
        la a0 next
        ecall
        
        mv a0 s2
        jal calcolaSuccessivo
        li a7 1
        ecall
        
        mv s2 a0
        li a7 4
        la a0 endl
        ecall
        
        mv a0 s2
    
        
        addi s0 s0 1
        j for
    fine:
    mv a0 s0
    lw ra 0(sp)
    jr ra



calcolaSuccessivo:
    addi sp sp -4
    sw s0 0(sp)
    
    andi s0 a0 1
    bnez s0 dispari
        srli a0 a0 1
        j return
    dispari:
        li s3 3
        mul a0 a0 s3
        addi a0 a0 +1
        j return
    return:
    lw s0 0(sp)
    addi sp sp 4
    jr ra 

