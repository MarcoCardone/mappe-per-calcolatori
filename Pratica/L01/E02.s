.data
var1: .string "m"
var2: .string "i"
var3: .string "p"
var4: .string "s"
var5: .byte 0
.text
main:
    #calcolo dell'offset per la conversione
    li t0,0x41
    li t1,0x61
    sub s0,t0,t1
    
    la t0,var1
    lb t1,0(t0)
    add t1,t1,s0
    sb t1,0(t0)
    
    la t0,var2
    lb t1,0(t0)
    add t1,t1,s0
    sb t1,0(t0)
    
    la t0,var3
    lb t1,0(t0)
    add t1,t1,s0
    sb t1,0(t0)
    
    la t0,var4
    lb t1,0(t0)
    add t1,t1,s0
    sb t1,0(t0)
    
    li a7,4
    la a0,var1
    ecall
    
fine:
    li a7,10
    ecall
    
