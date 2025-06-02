# Proposta soluzione COMPITO D'ESAME 2024-07-18
#
num_elem = 10
range_min = 4
range_max = 8

        .data
vet: 		.byte  6, 2, 4, 3, 10, 8, 5, 9, 11, 4 
val_max1:	.byte 0
val_max2:	.byte 0

msg1:         .asciiz "\nElementi nel range :"
msg2:         .asciiz "\nVal_max1-pos :"
msg3:         .asciiz "\nVal_max2-pos :"

		 
	 
		.text
		.globl main
		.ent main

main:	subu $sp, $sp, 4
		sw $ra, ($sp)
        
		la $a0, vet
        li $a1, num_elem        #numero elementi del vettore
		li $a2, range_min       # valore V1
		li $a3, range_max       # valore V2

        subu $sp, $sp, 8        # spazio per valori di ritorno        
        
        jal vCalc
        
        lw $t0, ($sp)       #pos-max1
        lw $t1, 4($sp)      #pos-max2
            
        addiu $sp, $sp, 8  # 4x2 posizione rit
        
        move $s2,$v0     
         
        # Print RISULTATO-1
        la $a0, msg1   #  "Elementi nel range :"
        li $v0, 4             
        syscall    
        
        move $a0, $s2  
        li  $v0, 1      
        syscall   

        # Print RISULTATO-2
        la $a0, msg2   # "\nVal_max1-pos :"
        li $v0, 4             
        syscall    
        
        move $a0, $t0 
        li  $v0, 1      
        syscall
        
                # Print RISULTATO-3
        la $a0, msg3   # "\nVal_max2-pos :"
        li $v0, 4             
        syscall    
        
        move $a0, $t1
        li  $v0, 1      
        syscall    
        
        lw $ra, ($sp)
        addiu $sp, $sp, 4	
		jr $ra

.end main


       .ent vCalc
        vCalc:
        
        subu $sp, $sp, 4
		sw $ra, ($sp)
        
        move $s0, $a0   #vet addr
        move $s1, $a1   #num elementi vettore
        move $s2, $a2   #V1
        move $s3, $a3   #V2
        
        li $t0, 0       #contatore ciclo 1
        li $t1, 0       #contatore elementi nel Range V1-V2
        
        loop1:
            bge $t0, $s1, end_loop1
            lb $t2,($s0)
            addi $t0, $t0, 1    #incr. contatore
            addi $s0, $s0,1
            blt $t2, $s2, loop1
            bgt $t2, $s3, loop1
            #Valore nel range
            addi $t1, $t1,1            
            j loop1
        end_loop1:  #Fine Loop1
            move $v0, $t1
           
               
            li $t0, 0       #contatore ciclo 2
            move $s0, $a0   #reinizializzo addr           
            lb $t1, ($s0)       #max1
            li $t2, 0       #pos max1
        loop2:           
            bge $t0, $s1, end_loop2
            lb $t9,($s0)
            ble $t9, $t1, incr2
                #nuovo max1
                move $t2, $t0  #pos max1
                move $t1, $t9   #val max1
                j incr2       
            incr2:
                addi $t0, $t0, 1    #incr. contatore
                addi $s0, $s0,1
                j loop2       
        end_loop2: 
                sb $t2, 4($sp) 
                       
            li $t0, 0       #contatore ciclo 2
            move $s0, $a0   #reinizializzo addr
            
            lb $t4, ($s0)       #max2
            li $t3, 0       #pos max1
        loop3:    
            beq $t0, $t2, incr3       
            bge $t0, $s1, end_loop3
            lb $t9,($s0)
            ble $t9, $t4, incr3
                #nuovo max1
                move $t3, $t0  #pos max2
                move $t4, $t9   #val max2
                j incr3       
            incr3:
                addi $t0, $t0, 1    #incr. contatore
                addi $s0, $s0,1
                j loop3       
        end_loop3: 
                sb $t3, 8($sp)                              

  
        lw $ra, ($sp)
        addiu $sp, $sp, 4
        
        jr $ra 
        .end vCalc

