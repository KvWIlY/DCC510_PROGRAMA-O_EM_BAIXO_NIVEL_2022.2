# Int exemplo_folha (int g, int h, int i, int j){
# 	Int f;
# 	f = (g+h) – (i + j);
# 	return f;
# }

.text
	li $a0, 20 # g = 20
	li $a1, 10 # h = 10
	li $a2, 10 # i = 10
	li $a3, 5  # j = 5
	jal func   # chama a função func
	jal exit   # chama a função pra encerrar o programa
	
	func:
		addi $sp, $sp, -4  	#
		sw $s0, 0($sp)		#
		
		add $t0, $a0, $a1	# (g+h)
		add $t1, $a2, $a3	# (i + j)
		sub $s0, $t0, $t1	# f = (g+h) – (i + j);
		move $s4, $s0		# move o resultado em s0 para s4
		
		lw $s0, 0($sp)		# restauramos o valor antigo de s0
		addi $sp, $sp, 4	#
		jr $ra			# volta pra onde ele foi chamado
		
	exit: 	#encerrar o programa
		li $v0, 1	
    		move $a0, $s4
    		syscall
    		
		li, $v0, 10 
    		syscall 
