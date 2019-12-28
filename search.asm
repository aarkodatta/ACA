.data
  prompt1: .asciiz "Enter number of elements - "
  prompt2: .asciiz "Enter the elements - "
  prompt3: .asciiz "Enter the position to check -  "
  prompt4: .asciiz "Enter the key to check - "
  prompt5: .asciiz "Your key value is in specified position!"
  prompt6: .asciiz "Your key value is not found at specified position!"
  
  array: .space 80 	#saving space for 20 integer elements - 20x4=80 bytes
  
.text
	######################
	#input array size
	######################
	la $a0,prompt1
	li $v0,4	#system call code to print string whose address is in $a0
	syscall
	
	li $v0,5	#system call code to read integer into $v0
	syscall
	move $t0,$v0	#$t0 contains upper bound 
	
	#######################
	#INPUT ARRAY ELEMENTS
	#######################
	la $a0,prompt2
	li $v0,4
	syscall
	
	la $t3,array	#base address
	li $t4,0	#loop counter
	input: bge $t4,$t0,proceed	#branch on $t4 greater or equal to $t0 to proceed
		
		li $v0,5
		syscall
		sw $v0,($t3)
		
		addi $t3,$t3,4	#next address calculation
		addi $t4,$t4,1	#increment loop counter
		j input
	proceed: 
	
	###################################################
	#input position to check
	#################################################
	la $a0,prompt3
	li $v0,4	#system call code to print string whose address is in $a0
	syscall
	
	li $v0,5	#system call code to read integer into $v0
	syscall
	move $t1,$v0	#$t1 contains the position
	
	#################################
	#input key to check
	#################################
	la $a0,prompt4
	li $v0,4	#system call code to print string whose address is in $a0
	syscall
	
	li $v0,5	#system call code to read integer into $v0
	syscall
	move $t2,$v0	#$t2 contains the key
	##############################
	la $t3,array
	li $t4,0
	search: bgt $t4,$t1,not_found
		lw $s0,($t3)
		beq $t1,$s0,found
		
		addi $t4,$t4,1		#incrementing loop counter
		addi $t3,$t3,4		#calculating next address
		j search
	
	found:		li $v0,4
			la $a0,prompt5
			syscall
			j end
	not_found:	li $v0,4
			la $a0,prompt6
			syscall
			j end
		
	end:	li $v0,10	#program code for exit system call
		syscall	
