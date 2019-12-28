.data
msg1: .asciiz "Enter the first number: "
msg2: .asciiz "\nEnter the second number: "
result1: .asciiz "\nThe result of addition is: "
result2: .asciiz "\nThe result of substraction is: "
result3: .asciiz "\nThe result of multiplication is: "
result4: .asciiz "\nThe result of division is: "
.text
li $v0,4
la $a0,msg1
syscall

li $v0,5
syscall
move $t1,$v0

li $v0,4
la $a0,msg2
syscall

li $v0,5
syscall
move $t2,$v0

Add $t3,$t1,$t2

li $v0,4
la $a0,result1
syscall

li $v0,1
move $a0,$t3
syscall

sub $t4,$t1,$t2

li $v0,4
la $a0,result2
syscall

li $v0,1
move $a0,$t4
syscall

mult $t1,$t2
mflo $t5
mfhi $t6

li $v0,4
la $a0,result3
syscall

li $v0,1
move $a0,$t5
syscall

div $t1,$t2
mflo $t7
mflo $t0

li $v0,4
la $a0,result4
syscall

li $v0,1
move $a0,$t7
syscall

li $v0,10
syscall