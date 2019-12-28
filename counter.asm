.data
msg:.asciiz"the increment counter is: "
msg1:.asciiz"\n the decrement counter is: "
sp:.ascii","
.text
li $t1,9
li $t0,0
la $a0,msg
li $v0,4
syscall
for_loop:
bgt $t0,$t1,second
li $v0,1
move $a0,$t0
syscall
la $a0,sp
li $v0,4
syscall
addi $t0,$t0,1
j for_loop

second:

li $t1,0
li $t0,9
la $a0,msg1
li $v0,4
syscall
for_loop1:
blt $t0,$t1,Exit
li $v0,1
move $a0,$t0
syscall
la $a0,sp
li $v0,4
syscall
subi $t0,$t0,1
j for_loop1
Exit:
li $v0,10
syscall