.data
wVett: .word 2, 5, 16, 12, 34, 7, 20, 11, 31, 44, 70, 69, 2, 4, 23 
    
wResult: .zero 4

.text
main:
    la t0,wVett 
    li t1,0 #t0t
    li t3,15 #N
    la t4,wResult
    li s1,1
    
while:
    lw,t2,0(t0) 
    add t1,t1,t2
    addi t0,t0,4 
    sub t3,t3,s1
    bnez t3,while
    
    sw t1,0(t4)
    
fine:
    li a7,10
    ecall
