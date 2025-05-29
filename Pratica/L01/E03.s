.data
op1: .byte 150 # 2^7 =128<150
op2: .byte 100
.text
main:
    
    #gestione di un elem tericamente in overflow
    la s11,op1
    lbu t0,0(s11)
    
    lb t1,op2
    add a0,t0,t1
    
    li a7,1
    ecall
    
fine:
    li a7,10
    ecall
    
