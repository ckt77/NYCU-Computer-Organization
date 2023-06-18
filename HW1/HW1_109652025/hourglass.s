.data
msg1:	.asciiz "Enter the number n = "
msg2:	.asciiz " "
msg3:	.asciiz "*"
msg4:	.asciiz "\n"


.text
.globl main
#------------------------- main -----------------------------
main:
# print msg1 on the console interface
	li      $v0, 4				
	la      $a0, msg1			
	syscall                 	
 
# read the input integer in $v0
 	li      $v0, 5          	
  	syscall                 	
  	move    $t0, $v0	# t0 = n
  	
  	addi	$t4, $zero, 2	# t4 = 2
  	addi	$t1, $t0, 1
  	div	$t1, $t1, $t4	# t1 = temp
  	div	$t2, $t0, $t4
  	mfhi	$t3	# Move the remainder from HI register to $t3
  	beq	$t3, $zero, L
  	addi	$t1, $t1, -1
	L:
	move	$t2, $zero	# t2 is i
	Loop1:
		bge	$t2, $t1, L1
		move	$t3, $zero	# t3 is j
		Loop2:
			bgt	$t3, $t2, L2
			li	$v0, 4				
			la	$a0, msg2			
			syscall
			addi	$t3, $t3, 1
			j	Loop2
		L2:
		move	$t3, $zero	# t3 is j
		addi	$t4, $zero, 2	# t4 = 2
		mul	$t5, $t2, $t4	# t5 = i * 2
		sub	$t4, $t0, $t5	# t4 = n - i * 2
		Loop3:
 			bge	$t3, $t4, L3
 			li	$v0, 4				
			la	$a0, msg3			
			syscall
			addi	$t3, $t3, 1
			j	Loop3
 		L3:
		li	$v0, 4				
		la	$a0, msg4		
		syscall
		addi	$t2, $t2, 1
		j	Loop1
	L1:
	addi	$t2, $t0, 1
	addi	$t4, $zero, 2	# t4 = 2
	div	$t2, $t2, $t4
	addi	$t2, $t2, -1 # t2 = i
	Loop4:
		blt	$t2, $zero, L4
		move	$t3, $zero	# t3 is j
		Loop5:
			bgt	$t3, $t2, L5
			li	$v0, 4				
			la	$a0, msg2			
			syscall 
			addi	$t3, $t3, 1
			j	Loop5
		L5:
		move	$t3, $zero # t3 is j
		addi	$t4, $zero, 2	# t4 = 2
 		mul	$t5, $t2, $t4
 		sub	$t4, $t0, $t5 # t4 = n - i * 2
		Loop6:
			bge	$t3, $t4, L6
 			li	$v0, 4				
			la	$a0, msg3			
			syscall
			addi	$t3, $t3, 1
			j	Loop6
		L6:
		li	$v0, 4				
		la	$a0, msg4		
		syscall
		addi	$t2, $t2, -1
		j	Loop4
	L4:
  	li $v0, 10
	syscall

