.text
main:
    li a0  5
    jal calcolaSuccessivo
    li a7 1
    ecall
    j fine


calcolaSuccessivo:
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
    jr ra 
    
fine:
    li a7 10 
    ecall
