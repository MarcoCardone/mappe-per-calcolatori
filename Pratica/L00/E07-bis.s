.data
buffer: .zero 255
messaggioINPUT: .string "\n Insersci un numero: \n"
messaggiOUTPUT: .string "\n Il Numero più piccolo è: "
DIM: .word 5
.text
main:
    li t0 0x7fffffff
    li t1,0
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
    
    blt a0,t0,min
next:
    addi t1,t1,1
    bne t1,s1,input 
    j output
min:
    mv t0,a0
    j next
output:
    li a7,4
    la a0,messaggiOUTPUT
    ecall
    
    li a7,1
    mv a0,t0
    ecall
    
fine:
    li a7,10
    ecall
    
    
