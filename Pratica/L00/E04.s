.data
wVett: .word 5, 7, 3, 4
    
wResult: .zero 4

.text
main:
    li t1,0
    la t0,wVett
    la t4,wResult
    
    lw t2,0(t0)
    add t1,t1,t2
    addi t0,t0,4
    
    lw t2,0(t0)
    add t1,t1,t2
    addi t0,t0,4
    
    lw t2,0(t0)
    add t1,t1,t2
    addi t0,t0,4
    
    lw t2,0(t0)
    add t1,t1,t2
    addi t0,t0,4
    
    sw t1,0(t4)
    
fine:
    li a7,10
    ecall
