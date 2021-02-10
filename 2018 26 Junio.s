##EXAMEN 26 JUNIO 2018
			
			.data
V:		.word 2,1,3,8,3,9,6,7
res:	.space 4

			.text
main:	li $t0,1	#t0 = res = 1
		la $t1,V	#t1 carga la dirección del vector
		li $t2,1	#t2 = i = 1
		li $t3,8	#t3 = num elem
		li $t4,3	#t4 comprueba que >= 3 & multiplo de 3
		li $t5,7	#t5 comprueba que <= 7
		
para:	bgt $t2,$t3,finpara
		lw $s0,0($t1)	#s0 = V[i]
		
		blt $s0,$t4,finsi	#V[i] >= 3
		
		bgt $s0,$t5,finsi	#V[i] <= 7
		
		div $s0,$t4
		mfhi $s1
		bne $s1,$0,finsi	#V[i] multiplo de 3
		
		mult $t0,$s0
		mflo $s2
		add $t0,$0,$s2
		
finsi:	addi $t1,$t1,4
		addi $t2,$t2,1
		j para

finpara:	sw $t0,res
			jr $31
			
#---------------------------------------------------------------#