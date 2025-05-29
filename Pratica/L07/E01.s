.equ '0' 48
.equ 'A' 65
.data
num: .word 141592653
base: .word 33

.text
main:
    lw a0 num
    lw a1 base
    jal parseNewBase
    jal printInNewBase
    
    j fine
    

parseNewBase:
    mv s0 a0
    mv s1 a1
    li a0 0
    while: beqz s0 done
        remu s11 s0 s1
        divu s0 s0 s1
        addi sp sp -4
        addi a0 a0 +1
        sw s11 0(sp)
        j while
    done:
    jr ra

printInNewBase:
    mv s11 a0
    li s10 10
    li a7 11
    for:beqz s11 done_f
        lw s1 0(sp)
        bge s1 s10 not_digit
            addi a0 s1 '0'
            j print 
        not_digit:
            sub a0 s1 s10
            addi a0 a0 'A'
            j print
        print:
            ecall
        addi s11 s11 -1
        addi sp sp +4
        j for
    done_f:
    jr ra
fine:
    li a7 10 
    ecall
     
