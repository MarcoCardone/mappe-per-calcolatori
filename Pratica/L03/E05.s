.data 
buffer: .zero 255 #char buffer[255]
inMsg: .string "Insersci un numero: "
ValMsg: .string "\nErrore carattere non valido"
InvMsg: .string "\nErrore primo valore non e' valido: deve essere {+,-}"
OverMsg: .string "\nErrore numero troppo Grande"
wVar: .word 0
.text
main:
    la t5,wVar
    lw t3,0(t5)
    
    #in message
    li a7,4
    la a0,inMsg
    ecall
    
    li a7,63
    li a0,0
    la a1,buffer
    li a2,255
    ecall
    
    li s0,0x0a # \n o 10
    li s1,0x30 # '0'
    li s2,0x3a # '9'+1
    li s3,0x2b # '+'
    li s4,0x2d # '-'
    
     
    
    lw s11,0(a1)
    andi t0,s11,0x0ff
    sub t1,s4,t0
    sub t2,s3,t0
    add t1,t1,t2
    
    li t2,-2
    bne t1,t2,skip1
    li s5,-1
    srli s11,s11,8
    j s_start
skip1:
    li t2,2
    bne t1,t2,error
    li s5,0
    srli s11,s11,8
    j s_start
    
error:
    li a7,4
    la a0,InvMsg
    ecall
    j fine
    
    
    addi a1,a1,-4
f_start:
    addi a1,a1,4
    lw s11,0(a1)
s_start:
    andi t0,s11,0x0ff
    beq t0,s0,sign
    srli s11,s11,8
    
    # t0 e un numero?
    slt t1,t0,s1
    slt t2,s2,t0
    bne t1,t2,not_num
    
    #atoi
    sub t0,t0,s1
    
    #cambio di posione
    mul t4,t3,s0
    
    #controllo overflow
    bltu t4,t3,overflow    


    mv t3,t4
    
    add t4,t3,t0
    
    #controllo overflow
    
    srli t6,t4,31
    bltu t4,t3,overflow  
    mv t3,t4
    
    beq s11,zero,f_start
    j s_start
    

overflow:
    li a7,4
    la a0,OverMsg
    ecall
    j fine

not_num:
    li a7,4
    la a0,ValMsg
    ecall
    j fine
    
sign:
    xor t3,t3,s5
    beq s5,zero,store
    addi t3,t3,1
store:    
    sw t3,0(t5)    
    j fine
fine:
    li a7,10
    ecall
    
