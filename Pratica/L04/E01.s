.data
FIB: .zero 80 #(20 elementi da 4 byte) 
.text
main:
    la s0 FIB
    
    add a0 zero s0
    addi a1 zero 1
    jal write # *FIB = 1
    
    addi a0 a0 4
    jal write #*(FIB++) = 1
    
    addi t3 zero 20
    addi t1 zero 1 # prcc
    addi t2 zero 1 # curr
    
    addi t0 zero 2 # i = 2 
for:
    bge t0 t3 fine # i >= 20 exit
    
    addi a0 a0 4
    add a1 t2 t1
    add t1 zero t2
    add t2 zero a1
    jal write
    addi t0 t0 1 #i++
    j for
fine:
    li a7 10
    ecall
write:
    sw a1,0(a0)
    jr ra
