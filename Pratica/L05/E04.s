.equ DIM 5

.data
matrix: .word 1, 0, 0, 0, 1
        .word 0, 2, 0, 0, 0
        .word 0, 0, 3, 0, 0
        .word 0, 0, 0, 4, 0
        .word 0, 0, 0, 0, 5
        
.text
main:
    la t0 matrix
    li s0 DIM

    li t3 0 
    li t1 0 # i = 1
    for_1: beq t1 s0 done_1
        li t2 0
        for_2: beq t2 t1 done_2
            mul s1 s0 t1
            mul s2 s0 t2
            add s1 s1 t2
            add s2 s2 t1
            slli s1 s1 2
            slli s2 s2 2
            
            add s1 t0 s1
            add s2 t0 s2
            
            lw s1 0(s1)
            lw s2 0(s2)
            
            bne s1 s2 NoDiag
            bnez s1 go_ahead
                addi t3 t3 2
            go_ahead:
            addi t2 t2 1
            j for_2
        done_2:
        addi t1 t1 1
        j for_1 
    done_1: 
    
mul s11 s0 s0
sub s11 s11 s0

li a0 1
bne t3 s11 print
addi a0 a0 1
j print

NoDiag:
    li a0 0
    j print
    
print:
    li a7 1
    ecall
    
fine:
    li a7 10
    ecall 
    
    
    

