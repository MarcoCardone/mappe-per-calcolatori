# Proposta soluzione COMPITO D'ESAME 2024-09-06
#
num_righe = 5
num_colonne = 7
.data
tempesta:	.byte  12, 15, 10, 0, 0, 0, 0
		.byte  0, 19, 15, 13, 12, 10, 4
		.byte  8, 14, 16, 13, 10, 8, 6
		.byte  0, 0, 8, 4, 3, 0, 0
		.byte  0, 0, 7, 3, 0, 0, 0
msg1:   .asciiz "\nN. celle interessate  dalla tempesta : " 
msg2:   .asciiz "-"
msg3:   .asciiz "\n"
	.text
	.globl main
	.ent main

main:   subu $sp, $sp, 4
        sw $ra, ($sp)
        
        #Print matrice  ANTE
        jal print_matrice 
        
        la $a0, tempesta
        li $a1, num_righe
        li $a2, num_colonne
        
        jal previsione
		
        move $s2,$v0     
         
        # Print RISULTATO-1
        la $a0, msg1   #  "N. celle interessate  dalla tempesta : "
        li $v0, 4             
        syscall    
        
        move $a0, $s2  
        li  $v0, 1      
        syscall 
        
        la $a0, msg3   
        li $v0, 4             
        syscall 
        
        #Print matrice  POST
        jal print_matrice 
    
        lw $ra, ($sp)
        addiu $sp, $sp, 4	
		jr $ra

.end main



.ent previsione
        previsione:
        
        subu $sp,$sp, 4
		sw $ra,($sp)

        move $s0,$a0   #salvo addr
        move $s1,$a1   #salvo num_righe
        move $s2,$a2   #salvo num_colonne
        
        move $t2,$s2   #cnt colonne
        sub $t2,$t2,2  #parto dalla penultima colonna
        
        move $t3,$s2   #offset fisso pari a numero colonne
        li $t6,0       #contatore celle > 0
        
    l_colonne:
        beq $t2,0,prima_colonna
        add $s0,$a0,$t2
        li $t4,0       #cnt elementi colonna
        l_righe:
            bge $t4,$s1,l_righe_end
            lb $t9, ($s0)
            beqz $t9,cont
                addi $t6,$t6,1
            cont:
            div $t8,$t9,2
            rem $t7,$t9,2
            beqz $t7,shift
                addi $t8,$t8,1
            
            #Shift dx di 1
            shift:
            sb $t8, 1($s0)
            
            addi $t4,$t4,1
            add $s0,$s0,$t3
            b l_righe
        
        l_righe_end:
        sub $t2,$t2,1
        b l_colonne  
        
    prima_colonna:
        move $s0,$a0
        li $t4,0      #cnt elementi colonna
        l_righe_last:
            bge $t4,$s1,l_fine
            lb $t9, ($s0)
            beqz $t9,cont_1
                addi $t6,$t6,1
            cont_1:            
            #Shift dx di 1
            div $t8,$t9,2
            rem $t7,$t9,2
            beqz $t7,shift1
                addi $t8,$t8,1
            
            #Shift dx di 1
            shift1:
            sb $t8, 1($s0)

            li $t9,0
            sb $t9,($s0)
            
            addi $t4,$t4,1
            add $s0,$s0,$t3
            b l_righe_last
  
    l_fine:
        move $v0,$t6
        lw $ra, ($sp)
        addiu $sp, $sp, 4
        
        jr $ra 
.end previsione
        
        
        
        
.ent print_matrice
        print_matrice:
        subu $sp,$sp, 4
		sw $ra,($sp)
        
        la $t0,tempesta
        li $t1,num_righe #cnt righe
        start_rig:
        beqz $t1,fine_rig
            li $t2,num_colonne
            start_col:
            beqz $t2,fine_col
                
                lb $a0,($t0)  
                li  $v0, 1      
                syscall
                
                la $a0, msg2   
                li $v0, 4             
                syscall    
                
                addi $t0,$t0,1 #incr addr matrice
                sub $t2,$t2,1
                b start_col
            fine_col:
                # a capo
                la $a0, msg3   
                li $v0, 4             
                syscall
                
                sub $t1,$t1,1
                b start_rig
        fine_rig: 
                lw $ra, ($sp)
                addiu $sp, $sp, 4
                	
                jr $ra
.end print_matrice

