.data
wOp1: .word 10
wOp2: .word 24
wResult: .zero 4

.text
main:
    la s1,wOp1
    la s2,wOp2
    la s3,wResult
    lw t0,0(s1)
    lw t1,0(s2)
    add t2,t0,t1
    sw t2,0(s3)
    
    
    
fine:
    li a7,10
    ecall
