.data
wVar: .word 3
.text
main:
    #E2
    la s11, wVar
    sw t0,0(s11)
    
fine:
    li a7,10
    ecall
