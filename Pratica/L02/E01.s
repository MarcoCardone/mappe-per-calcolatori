.data
buffer: .zero 255
InputMessage: .string "\nInserisci un numero: "
MessageEven: .string "\nIl numero e' pari"
MessageOdd: .string "\nIl numero e' dispari" 
.text

main: 
    li s11,0x30
    
    li a7, 4
    la a0, InputMessage
    ecall
    #getc
    li a7,63
    li a0,0
    la a1,buffer
    li a2,255
    ecall
    
    #atoi
    lw t0,0(a1)
    andi t0,t0,255
    sub t0,t0,s11

    #logic
    andi t1,t0 1
    
    beq t1,x0,even
    j odd
    
even:
    li a7,4
    la a0,MessageEven
    ecall
    j fine
odd:
    li a7,4
    la a0,MessageOdd
    ecall
    j fine 
fine:
    li a7,10
    ecall
