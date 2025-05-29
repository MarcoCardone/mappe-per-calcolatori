.data
n: .word 4
k: .word 2
.text
main:
    lw a0 n
    lw a1 k
    jal combina
    j fine
    
combina:
    addi sp sp -20
    sw ra 0(sp)
    
    sw a0 4(sp)
    jal fattorial
    sw a0 8(sp)
    

    
    sw a1 12(sp)
    mv a0 a1
    jal fattorial
    sw a0 16(sp)
    
    lw s0 4(sp)
    lw s1 12(sp)
    
    sub s2 s0 s1
    mv a0 s2
    jal fattorial
    
    lw s0 8(sp)
    lw s1 16(sp)
    
    mul a0 a0 s1
    div a0 s0 a0
    lw ra 0(sp)
    addi sp sp +20
    jr ra
fattorial:
    li s0 1
    for: beqz a0 done
        mul s0 s0 a0
        addi a0 a0 -1
        j for
    done:
    mv a0 s0
    jr ra

fine:
    li a7 10
    ecall
    
