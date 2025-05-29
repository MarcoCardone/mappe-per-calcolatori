.data
pitagora: .zero 400
.text
main:
    la s0 pitagora
    li s11 10
    li t0 0
    for_1:beq t0,s11 done_1
        mv t1 t0
        for_2: beq t1 s11 done_2
            addi t2 t0 1 
            addi t3 t1 1
            mul t3 t3 t2 # op = (i+1)*(j+1)
            
            mul t4 s11 t0
            add t4 t4 t1
            slli t4 t4 2
            add s1 s0 t4
            sw t3 0(s1)
            
            mul t4 s11 t1
            add t4 t4 t0
            slli t4 t4 2
            add s1 s0 t4
            sw t3 0(s1)
        
            addi t1 t1 1
            j for_2
        done_2:
        addi t0 t0 1
        j for_1
    done_1:
fine:
    li a7 10
    ecall
        
