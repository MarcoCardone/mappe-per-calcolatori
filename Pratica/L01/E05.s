.data
buffer: .zero 255
messaggio: .string "\n Inserisci un numero: "

.text
main:
    li s11,0x30
    
    li a7,4
    la a0,messaggio
    ecall
    
    li a7,63
    li a0,0
    la a1,buffer
    li a2,255
    ecall
    
    lw t1,0(a1)
    andi t1,t1,0x0ff
    sub t1,t1,s11
    
    li a7,4
    la a0,messaggio
    ecall
    
    li a7,63
    li a0,0
    la a1,buffer
    li a2,255
    ecall
    
    lw t2,0(a1)
    andi t2,t2,0x0ff
    sub t2,t2,s11
    
    xor t1,t1,t2
    xor t2,t1,t2
    xor t1,t1,t2
    
    
fine:
    li a7,10
    ecall
    
