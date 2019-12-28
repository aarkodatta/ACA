.data

  prompt1: .asciiz "Enter number of elements - "
  prompt2: .asciiz "Enter the elements - "
  prompt3: .asciiz "Sorted array is -  "
  prompt4: .asciiz " "
  
  array: .space 80 	#saving space for 20 integer elements - 20x4=80 bytes
  
.text

	la $a0,prompt1
	li $v0,4	#system call code to print string whose address is in $a0
	syscall
	
	li $v0,5	#system call code to read integer into $v0
	syscall
	move $t0,$v0	#$t0 contains upper bound 
	
	
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
	
	
	li $t4,0	#$t4 is outer loop counter
	outer_loop: bge $t4,$t0,done	 #loop condition : branch on $t4 equals $t1 to label done
	
		la $s0,array	#base address is in $s0
		li $t5,1	#$t5 is inner loop counter (runs only n-1 times bcz n-1 pairs of values to compare)
		inner_loop: bge $t5,$t0,finished
			
			lw $s1,($s0)
			lw $s2,4($s0)
			
			blt $s1,$s2,in_order	#if $s1<$s2 then skip swapping
			
				#store with swap
				sw $s1,4($s0)
				sw $s2,($s0)
		
			in_order: addi $t5,$t5,1	#incrementing inner_loop counter
			addi $s0,$s0,4	#calculating next memory address
			j inner_loop
			
		finished: addi $t4,$t4,1	#incrementing outer_loop counter
		j outer_loop
	
	done: 
	la $a0,prompt3
	li $v0,4
	syscall
	la $t3,array	#base address
	li $t4,0	#loop counter
	output: bge $t4,$t0,end	#branch on $t4 greater or equal to $t0 to end
		
		#load word from array and print
		lw $a0,($t3)
		li $v0,1
		syscall
		#print a space
		la $a0,prompt4
		li $v0,4
		syscall
		
		addi $t3,$t3,4	#next address calculation
		addi $t4,$t4,1	#increment loop counter
		j output
		
	end: li $v0,10	#program code for exit system call
		syscall	