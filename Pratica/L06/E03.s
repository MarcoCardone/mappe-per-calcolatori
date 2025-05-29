.equ 'A' 65
.equ '-A' -65
.equ 'Z' 90
.equ 'a' 97
.data
StringToConv: .string "DeVo RenDere quSTA StrIngA tuTTA in miNusCOlo."
.text
    la s0 StringToConv
    
    li a7 4
    mv a0 s0
    ecall
    
    lb t0 0(s0)
    foreach: beqz t0 done
        mv a0 t0
        jal toLower
        beq a0 t0 do_nothing 
        sb a0 0(s0)
        do_nothing:
        addi s0 s0 1
        lb t0 0(s0)
        j foreach
    done:
    jal endl
    li a7 4
    la a0 StringToConv
    ecall
    j fine
toLower:
    li s1 'A'
    li s2 'Z'
    blt s2 a0 dont_cast
    blt a0 s1 dont_cast
    addi a0 a0 '-A'
    addi a0 a0 'a'
    dont_cast:
    jr ra
endl:
    li a7 11
    li a0 10
    ecall
    jr ra
fine:
    li a7 10 
    ecall
