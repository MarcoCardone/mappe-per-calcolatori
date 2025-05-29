.data
buffer: .zero 255
wVett:  .word 0

messaggioINPUT: .string "\n Insersci un numero: \n"
messaggiOUTPUT: .string "\n Il Numero più piccolo è: "
DIM: .word 5
.text
main:
    la s0,wVett
    li t0,1
    lw s1,DIM
    li s11,0x30
    
    li a7,4
    la a0,messaggioINPUT
    ecall
    
input:
    li a7,63
    li a0,0
    la a1,buffer
    li a2,255
    ecall
    
    lw a0,0(a1)
    andi a0,a0,0x0ff
    sub a0,a0,s11
    sw a0,0(s0)  
    beq t0,s1,calc
    addi t0,t0,1
    addi s0,s0,4
    j input
calc:
    la s0,wVett
    li t0,0
    lw t2,0(s0)
    addi s0,s0,4
loop_min:
    beq t0,s1,print
    lw t3,0(s0)
    blt t3,t2,minimo
count:
    addi t0,t0,1
    addi s0,s0 4
    j loop_min

minimo:
    mv t2,t3
    j count


print:
    li a7,4
    la a0,messaggiOUTPUT
    ecall
    
    li a7,1
    mv a0,t2
    ecall
fine:
    li a7,10
    ecall
    
    
