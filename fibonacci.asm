.data

  prompt1: .asciiz "Enter the upper bound - "
  prompt2: .asciiz "Fibonacci Series - "
  prompt3: .asciiz " "
.text

	la $a0,prompt1
	li $v0,4	#system call code to print string whose address is in $a0
	syscall
	
	li $v0,5	#system call code to read integer into $v0
	syscall
	move $t1,$v0	#$t1 contains upper bound 
	
		
	 li $t2,0	#first fibonacci
	li $t3,1	#second fibonacci
	
	la $a0,prompt2
	li $v0,4
	syscall
	
	li $t4,0	#$t4 is loop counter
	loop: 
		beq $t4,$t1,done	 #loop condition : branch on $t4 equal $t1 to label done
			
		li $v0,1	#system call code to print integer which is in $a0
		move $a0,$t2
		syscall
		la $a0,prompt3
		li $v0,4
		syscall
		
		move $t5,$t2	#temporary 
		move $t2,$t3
		add $t3,$t3,$t5	
		
		addi $t4,$t4,1	#incrementing loop counter
		j loop
	
	done: 
		li $v0,10	#exit system call code
		syscall
	 
 