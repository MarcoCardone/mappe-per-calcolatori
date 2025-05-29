.data
n1: .byte     10
n2: .byte     0x10
n3: .string   "1"
res: .zero     1
.text
main:
    lb t0,n1
    lb t1,n2
    sub t0,t0,t1
    lb t1,n3
    add t0,t0,t1
    la t2,res
    sb t0,0(t2)
    
fine:
    li a7,10
    ecall
    
