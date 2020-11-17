.data
	endl: .asciiz     "\n"
	arr: .word 1 2 3 4 5
	IfGreater : .asciiz "first element is greater than or equal 1"
	IfLess : .asciiz "first element is less  than 1"
.text
.global main
main:
	## Need bouns for this magic code :D :)
	## Print A[0] ##
	la      $t1, arr
	lw	$t2 , 0($t1)
   	la    	$a0,($t2)
   	li    	$v0,1
   	syscall
   	## Separte New Line ##
   	la    	$a0,endl	
   	li    	$v0,4
   	syscall
   	## Print A[1] ##
   	lw	$t3 , 4($t1)
   	la    	$a0,($t3)
   	li    	$v0,1
   	syscall
   	## Separte New Line ##
   	la    	$a0,endl	
   	li    	$v0,4
   	syscall
   	## Set A[0] -> A[0] * 2 ##
   	la      $t1, arr
   	li 	$t0, 2
   	mul  	$t2,$t2,$t0 # $t2 is already have value of A[0]
   	sw 	$t2, 0($t1) # Store value of $t2 in 0 $t1(A[0])
   	## Set A[1] -> A[1] * 3 ##
   	li 	$t0, 3
   	mul 	$t3,$t3,$t0 # $t3 is already have value of A[1]
   	sw  	$t3, 4($t1) # Store value of $t3 in 4 $t1(A[1])
   	## Print A[0] ##
   	lw	$t2 , 0($t1)
   	la    	$a0,($t2)
   	li    	$v0,1
   	syscall
   	## Separte New Line ##
   	la    	$a0,endl	
   	li    	$v0,4
   	syscall
   	## Print A[1] ##
   	lw	$t3 , 4($t1)
   	la    	$a0,($t3)
   	li    	$v0,1
   	syscall
   	## Separte New Line ##
   	la    $a0,endl	
   	li    $v0,4
   	syscall
   	### if(array[0]>=1)-> print greater or equal else print less ###
   	slti  	$s0,$t2,1      # checks if $t2(A[0]) < 1 (immediate value) # $t2 already have value of A[0]
	beq 	$s0,1,less    # if $t2(A[0]) < 1 , goes to less as s0 will have value of 1
	beq 	$t2,1,GreaterOrEqual   # if 1 = $t2(A[0]), goes to GreaterOrEqual 
	beq 	$s0,$zero,GreaterOrEqual # if 1 < $t1(A[0]), goes to GreaterOrEqual as s0 will have value of 0
   	less : 
   		la    	$a0,IfLess # print string
   		li 	$v0,4
   		syscall
   		## Exit
   		 li  	$v0,10	# exit
   		syscall
   	GreaterOrEqual :
   		la    	$a0,IfGreater # print string
   		li    	$v0,4
   		syscall
   		## Exit
   		li    	$v0,10	# exit
   		syscall

