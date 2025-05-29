.data 
buffer: .zero 255 #char buffer[255]
inMsg: .string "Insersci un numero: "
erMsg: .string "\nErrore caratter non valido"
ouMsg: .string "\n Numero Valido"
.text
main:
    #in message
    li a7,4
    la a0,inMsg
    ecall
    
    li a7,63
    li a0,0
    la a1,buffer
    li a2,255
    ecall
    
    li s0,0x0a
    li s1,0x30
    li s2,0x3a
    addi a1,a1,-4
    
f_start:
    addi a1,a1,4
    lw s11,0(a1)
s_start:
    andi t0,s11,0x0ff
    beq t0,s0,is_num
    srli s11,s11,8
    slt t1,t0,s1
    slt t2,s2,t0
    bne t1,t2,not_num
    beq s11,zero,f_start
    j s_start
    


not_num:
    li a7,4
    la a0,erMsg
    ecall
    j fine
is_num:
    li a7,4
    la a0,ouMsg
    ecall
    j fine  
fine:
    li a7,10
    ecall
