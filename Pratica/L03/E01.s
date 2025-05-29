.data 
op1: .word 0x0000d000
op2: .word 0xffffd000
error: .string "overflow"
endl: .string "\n"
.text
main:
    lw t0,op1
    lw t1,op2
    mv a0,t0
    mv a1,t0
    jal check_mult
    
    mv a0,t1
    mv a1,t1
    jal check_mult
    
    mv a0,t0
    mv a1,t1
    jal check_mult
    
    
fine:
    li a7,10
    ecall
    
    
check_mult:
    addi sp,sp,-12
    sw ra, 8(sp)
    sw t1, 4(sp)
    sw t0, 0(sp)
    
    
    mv t0,a0
    mv t1,a1
    mul a0,t0,t1
    mulhu a1,t0,t1
    
    bne a1,zero,catch
    jal print_num
    j exit
catch:
    jal overflow
    j exit
exit:
    lw ra, 8(sp)
    lw t1, 4(sp)
    lw t0, 0(sp)
    addi sp,sp,12
    jr ra    
##function


print_num:
    li a7,36 
    ecall
    li a7,4
    la a0,endl
    ecall
    jr ra 
 
overflow:
    li a7,4
    la a0,error
    ecall
    li a7,4
    la a0,endl
    ecall
    jr ra     


