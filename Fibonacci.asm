.data
	str:.asciiz "F(n) is : "
.text
	li $a1,20 #Assume that n = 6 
	addi $t1,$t1,0 # a = 0
	addi $t2,$t2,1 # b = 1
	loop:
		slti $s0,$a1,1 # if n < 1
		beq $s0,1,breakLoop # n<1 is true ->break
		beq $a1,1,breakLoop # n==1 is true ->break
		beq $s0,0,continue # n>1 is ture ->continue
		breakLoop:
			la $a0,str # get stiring 
			li $v0,4 #print string
			syscall
			move $a0,$t3 # return n to $a0 to print it 
			li $v0,1 # print int
			syscall
			li $v0,10 #exit (Condition false (n>1))
			syscall
		continue:
			add $t3,$t2,$t1 # c = a + b 
			move $t1,$t2 # a = b
			move $t2,$t3 # b = c
			subi $a1,$a1,1 # n--
			j loop #continue loop
		