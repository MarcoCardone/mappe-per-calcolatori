.equ '\n' 0x0a
.equ '\s'  0x20

.data
inputMSG: .string "\nInserisci testo palindroma: "
NoPalindMSG: .string "\nSpiacente ma il testo non e' palindroma"
PalindMSG: .string "\nIl testo inserito  e' palindromo "
letter: .zero 1
.text
main:
    li a7 4
    la a0 inputMSG
    ecall
    
    li s10 '\s'
    li s11 '\n'
    
    addi sp sp -4
    mv s0 sp
    
    gets:
        li a7 63
        li a0 0
        la a1 letter 
        li a2 1
        ecall
        lw t0 0(a1)
        beq t0 s10 gets
        beq t0 s11 done
        sw t0 0(sp)
        addi sp sp -4
        j gets
    done: 
    addi sp sp +4
    
checking:
    lw t0 0(s0)
    lw t6 0(sp)
    bne t0 t6 no_pal
    bgeu s0 sp pal
    addi s0 s0 -4
    addi sp sp +4
    j checking


no_pal:
    li a7 4
    la a0 NoPalindMSG
    ecall
    j fine
    
pal:
    li a7 4
    la a0 PalindMSG
    ecall
    j fine
    
fine:    
    li a7 10
    ecall

