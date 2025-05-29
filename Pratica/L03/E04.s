.data 
buffer: .zero 255 #char buffer[255]
inMsg: .string "Insersci un numero: "
ValMsg: .string "\nErrore carattere non valido"
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
    
    addi a1,a1,-4
f_start:
    addi a1,a1,4
    lw s11,0(a1)
s_start:
    andi t0,s11,0x0ff
    beq t0,s0,store
    srli s11,s11,8
    
    # t0 e un numero?
    slt t1,t0,s1
    slt t2,s2,t0
    bne t1,t2,not_num
    
    #atoi
    sub t0,t0,s1
    
    #cambio di posione
    mul t4,t3,s0
    mulhu s3,t3,t0
    
    #controllo overflow molt uns
    bne s3,zero,overflow    
    mv t3,t4
    
    
    add t4,t3,t0
    
    #controllo overflow add uns
    
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
store:    
    sw t3,0(t5)    
    j fine
fine:
    li a7,10
    ecall
    
