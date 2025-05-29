.data
buffer: .zero 255
messageIn:  .string "\n Inserisci un numero: "
messageOut: .string "\n il valore numerico di !(A && !B) || (A^B): "
messageErr: .string "\n Errore: num non rappresentabile da un byte"
.text
main:
    li s11,0x30    
 
    li a7,4
    la a0,messageIn
    ecall
    
    li a7,63
    li a0,0
    la a1,buffer
    li a2,0xff
    ecall
    
    lw t0,0(a1)
    andi t0,t0,0x0ff
    sub t0,t0,s11
    
    andi s0,t0,0x0ff
    bne s0,t0,error
    
    li a7,4
    la a0,messageIn
    ecall
    
    li a7,63
    li a0,0
    la a1,buffer
    li a2,0xff
    ecall
    
    lw t1,0(a1)
    andi t1,t1,0x0ff
    sub t1,t1,s11
    
    andi s0,t1,0x0ff
    bne s0,t1,error

    xori s1,t1,-1 # !B
    and  s2,t0,s1 # A && (!B)
    xori s3,s2,-1 # !(A &&(!B))
    xor  s4,t0,t1 # (A^B)
    or   s5,s3,s4 # !(A &&(!B)) || (A^B)
    
    li,a7,4
    la a0,messageOut
    ecall
    
    li a7,1
    mv a0,s5
    ecall
    j fine
    
error:
    li a7,4
    la a0,messageOut
    ecall
fine:
    li a7,10
    ecall
