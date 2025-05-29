.data
wVar0: .word 17
wVar1: .word 8
wVar2: .word 13
sep: .string ", "

.text
main:
    la s0,wVar0
    la s1,wVar1
    la s2,wVar2
    
    lw t0,0(s0)
    lw t1,0(s1)
    lw t2,0(s2)
    
    bge t0,t1,swapAB
second_if:
    bge t0,t2,swapAC
third_if:
    bge t1,t2,swapBC
    j store
     
swapAB:
    xor t0,t0,t1
    xor t1,t0,t1
    xor t0,t0,t1
    j second_if
    
swapAC:
    xor t0,t0,t2
    xor t2,t0,t1
    xor t0,t0,t2
    j third_if

swapBC:
    xor t1,t1,t2
    xor t2,t1,t2
    xor t1,t1,t2

    
store:
    sw t0,0(s0)
    sw t1,0(s1)
    sw t2,0(s2)
print:
    li a7,1
    lw a0,0(s0)
    ecall
    
    li a7,4
    la a0,sep
    ecall
    
    li a7,1
    lw a0,0(s1)
    ecall
    
    li a7,4
    la a0,sep
    ecall
    
    li a7,1
    lw a0,0(s2)
    ecall
 
fine:
    li a7,10
    ecall
