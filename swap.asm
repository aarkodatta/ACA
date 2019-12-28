.data
msg1: .asciiz "Enter the first number: "
msg2: .asciiz "\nEnter the second number: "
result1: .asciiz "\nAfter swap the first number is : "
result2: .asciiz "\nAfter swap the second number is : "
.text
li $v0,4
la $a0,msg1
syscall

li $v0,5
syscall
move $t0,$v0

li $v0,4
la $a0,msg2
syscall

li $v0,5
syscall
move $t1,$v0

add $t2,$t0,$t1
sub $t3,$t2,$t1
sub $t4,$t2,$t3
li $v0,4
la $a0,result1
syscall

li $v0,1
move $a0,$t4
syscall

li $v0,4
la $a0,result2
syscall
li $v0,1
move $a0,$t3
syscall



li $v0,10
syscall