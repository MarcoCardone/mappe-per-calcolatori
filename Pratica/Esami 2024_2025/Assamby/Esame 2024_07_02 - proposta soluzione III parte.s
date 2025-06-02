# Proposta soluzione COMPITO D'ESAME 2024-07-02
#

num_days = 7
num_areas = 9
.data
temperatures: .byte  23, 25, 25, 24, 23, 26, 24, 22, 26 #giorno1
              .byte  26, 26, 24, 23, 22, 23, 22, 20, 25 #giorno2
              .byte  21, 20, 19, 23, 23, 22, 22, 19, 22 #giorno3
              .byte  17, 16, 17, 19, 18, 20, 21, 20, 19 #giorno4
              .byte  19, 22, 20, 21, 20, 20, 19, 19, 20 #giorno5
              .byte  21, 20, 22, 21, 23, 24, 24, 22, 21 #giorno6
              .byte  22, 21, 20, 20, 19, 22, 22, 21, 20 #giorno7
 
max_day:      .byte 0                # Variabile per memorizzare il giorno della temperatura massima
max_area:     .byte 0                # Variabile per memorizzare l'area della temperatura massima
msg1:         .asciiz "Risultato Ex :"
msg2:         .asciiz "\nRisultato Area :"
msg3:         .asciiz "\nRisultato Day :"


		 
		.text
		.globl main
		.ent main

main:	subu $sp, $sp, 4
		sw $ra, ($sp)
		la $a0, temperatures
		la $a1, max_day
		la $a2, max_area
		li $a3, num_days
		li $t0, num_areas
        subu $sp,$sp,4
		sw $t0, ($sp)
        
        jal max_excursion
        
        addiu $sp, $sp, 4
        move $s2,$v0     
         
        # Print RISULTATO-1
        la $a0, msg1   
        li $v0, 4             
        syscall    
        
        move $a0, $s2  
        li  $v0, 1      
        syscall   

        # Print RISULTATO-2
        la $a0, msg2   
        li $v0, 4             
        syscall    
        
        lb $a0, max_area  
        li  $v0, 1      
        syscall
        
        # Print RISULTATO-3
        la $a0, msg3   
        li $v0, 4             
        syscall    
        
        lb $a0, max_day  
        li  $v0, 1      
        syscall        
        
        lw $ra, ($sp)
        addiu $sp, $sp, 4	
		jr $ra
		.end main


.ent max_excursion
max_excursion:
    subu $sp, $sp, 4
	sw $ra, ($sp)
    #  save
    move $s0,$a0     #temperatures
	move $s1,$a1     #max_day - var
	move $s2,$a2     #max_area - var
	move $s3,$a3     #num_days
    lw   $s4,4($sp)  #num_areas
     
    #
    li $t0, 0       # contatore colonne
    li $t1, 0       # offset inizio colonna
    li $s7,0        #init max_excursion
    loop1:
        # Posizionamento
        addu $s0, $s0, $t1  #$s0 puntatore primo elemento colonna max_area
        move $s5, $s0       #$s5 puntatore elementi colonna
        li $t1, 1           #contatore elementi colonna = num_days
        loop2:   
            beq $t1,$s3,next_col     
            lb $t2,($s5)    # giorno corrente
            add $s6, $s5, $s4 # si somma offset pari al numero Aree
            lb $t3,($s6)   # giorno + 1
            
            # calcolo         
            sub $t2,$t2,$t3
            abs $t3,$t2
            
            ble $t3,$t7, next_col
            
            #update
            move $t7,$t3    #max_excursion
            sb $t1,($s1)   #max_day
            sb $t0,($s2)   #max_area
            
            # incremento colonna
            next_col:
            addi $t1,$t1,1
            add $s5, $s5,$s4 # offset sempre uguale al numero delle Aree
            blt $t1,$s3,loop2 # passo alla colonna successiva
            #
        addi $t0,$t0,1      # incremento cnt colonne
        li $t1, 1           # offset inizio colonna
        blt $t0, $s4, loop1    
    #
    move $v0, $t7           #aggiorno max_excursion
    lw $ra, ($sp)
    addiu $sp, $sp, 4 
    jr $ra
.end max_excursion
