# enumerazioni o equivalenze

.data

opa: .word 2043
opb: .word 5
res: .word 0

char: .zero 1
input_message: .string "Cosa si desidera fare\n(0 = SOMMA)\n(1 = DIFFERENZA)\n(2 = PRODOTTO)\n(3 = DIVISIONE INTERA)\n: "
default_message: .string "\nSpiacente ma non esiste nessuna op per questo comando\n"
output_message: .string "\nil risultato dell' operazione e': "
endl: .string "\n"
.text
main:
    lw t0 opa
    lw t1 opb
    la s0 res
    
    la a0,input_message
    jal print_s
    jal getd
    
    li s1 0
    beq a0 s1 SOM    
    
    li s1 1
    beq a0 s1 DIF   
    
    li s1 2
    beq a0 s1 PRD
        
    li s1 3
    beq a0 s1 DII    
    
    jal default 
    j fine  
    
break:
    la a0 output_message
    jal print_s
    
    mv a0 t2
    jal print_i
    
    la a0 endl
    jal print_s
    
    sw t2 0(s0)
    j fine
    
    
SOM:
    add t2,t0,t1
    j break
DIF:
    sub t2,t0,t1
    j break
PRD:
    mul t2,t0,t1
    j break
DII:
    mul t2,t0,t1
    j break
    
default:
    addi sp sp -4
    sw ra 0(sp)
    la a0 default_message
    jal print_s
    lw ra 0(sp)
    addi sp sp 4
    jr ra
    
print_s:
    li a7 4
    ecall
    jr ra
print_i:
    li a7 1
    ecall
    jr ra
    
getd:
    addi sp sp -4
    sw s11 0(sp)
    
    li a7,63
    li a0,0
    la a1 char
    li a2 1
    ecall
    lw a0,0(a1)
    andi a0 a0 0x0ff
    li s11,0x30
    sub a0 a0 s11
    
    lw s11 0(sp)
    addi sp sp +4
    jr ra
fine:
    li a7,10
    ecall
