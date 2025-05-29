.data
X: .word 2,4,1,2
Y: .word 3,2,1,4
XY: .zero 64
.text
main:
    la s0 X
    la s1 Y
    la s2 XY
    li s11,4 # N = 4
    li t0,0 # i = 0
for_1: beq t0 s11 done_1
    li t1,0 # j = 0
    for_2:beq t1 s11 done_2
        lw t2 0(s0)
        lw t3 0(s1)
        mul t4 t3 t2
        sw t4 0(s2)
        addi s1 s1 4
        addi s2 s2 4
        addi t1 t1 1
        j for_2
    done_2:   
    la s1 Y
    addi s0 s0 4
    addi t0 t0 1
    j for_1
done_1:
fine:
    li a7 10
    ecall

