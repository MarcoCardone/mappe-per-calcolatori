.data
hVar: .half 598
str1: .string "\n Il numero di bit a 1 di "
str2: .string " e "
.text
main:
    la s0,hVar
    lh t0,0(s0)
    li t2,0

while:
    beq t0,zero,done
    andi,t1,t0,1
    add t2,t2,t1
    srli t0,t0,1
    j while
done:
    li a7,4
    la a0,str1
    ecall

    li a7,1
    lh a0,0(s0)
    ecall

    li a7,4
    la a0,str2
    ecall

    li a7,1
    mv a0,t2
    ecall
fine:
    li a7,10
    ecall
