.data
buffer:  .zero 255
wRes:    .zero 20
MessaggioIN:  .string "\n Inserisci numeri: "
MessaggioOut: .string "\n Numeri inseriti: "
separatore: .string " ; "

.text
main:
    li a7,4
    la a0,MessaggioIN
    ecall
    
    la s0,wRes
    li t0,0 #i
    li s1,0x30
    li s11,4 #DIM
input:
    #getc
    li a7,63
    la a0,0
    la a1,buffer
    li a2,255
    ecall
    #atoi
    lw a0,0(a1)
    andi a0,a0,0x0ff
    sub a0,a0,s1
    #immagazino
    sw a0,0(s0)
    beq t0,s11,print
    addi t0,t0,1
    addi s0,s0,4
    j input
print:
    li a7,4
    la a0,MessaggioOut
    ecall    
    la s0,wRes
    li t0,0
ciclo:
    li a7,1
    lw a0,0(s0)
    ecall
    
    beq t0,s11,fine
    
    li a7,4
    la a0,separatore
    ecall
    
    addi t0,t0,1
    addi s0,s0,4
    j ciclo
fine:
    li a7,10
    ecall
    
    

    
      
