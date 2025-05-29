.equ '-0' -48
.data
InsE: .string "\nInserisci i coeffiente dell equazione ax^2 + bx +c = 0 "
InsA: .string "\nInserisci il coeffincente (a): "
InsB: .string "Inserisci il coeffincente (b): "
InsC: .string "Inserisci il coeffincente (c): "
TwoRealSol: .string "\nEsistono 2 soluzioni reali e distinte"
OneRealSol: .string "\nEsistono 2 soluzioni reali e cooincidenti (1 soluzione)"
NoRealSol: .string "\nNon esistno soluzioni reali"
buffer: .zero 8

.text
main:
    
    li a7 4
    la a0 InsE
    ecall
    
    li a7 4
    la a0 InsA
    ecall
    
    li a7 63
    li a0 0
    la a1 buffer
    li a2 8
    ecall
    lw t0 0(a1)
    andi t0 t0 0x0ff
    addi t0 t0 '-0'
    addi sp sp -4
    sw t0 0(sp)
 
 
    li a7 4
    la a0 InsB
    ecall
    
    li a7 63
    li a0 0
    la a1 buffer
    li a2 8
    ecall
    lw t0 0(a1)
    andi t0 t0 0x0ff
    addi t0 t0 '-0'
    addi sp sp -4
    sw t0 0(sp)
 
    
    li a7 4
    la a0 InsC
    ecall
    
    li a7 63
    li a0 0
    la a1 buffer
    li a2 8
    ecall
    lw t0 0(a1)    
    andi t0 t0 0x0ff
    addi t0 t0 '-0'
    addi sp sp -4
    sw t0 0(sp)
    
    lw t0 8(sp)
    lw t1 4(sp)
    lw t2 0(sp)
    
    mul t1 t1 t1
    mul t0 t0 t2
    slli t0 t0 2
    sub t0 t1 t0
    
    beqz t0 oneRealSol
    slt t0 t0 zero
    bnez t0 noRealSol
    j twoRealSol
    
   
twoRealSol:   
    la a0 TwoRealSol
    j stampa
oneRealSol:   
    la a0 OneRealSol
    j stampa 
noRealSol:   
    la a0 NoRealSol
    j stampa
stampa:
    li a7 4
    ecall
    j fine    
    
fine:    
    li a7 10
    ecall

