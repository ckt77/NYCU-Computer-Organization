.data
msg1:	.asciiz "Enter the number n = "
msg2:	.asciiz " is a prime"
msg3:	.asciiz	" is not a prime, the nearest prime is "
msg4:	.asciiz	" "

.text
.globl main
main:
	li      $v0, 4				
	la      $a0, msg1			
	syscall
	
	li      $v0, 5          	
  	syscall
  	
  	move	$t5, $zero	# t5 = flag            	
  	move	$t1, $v0	# t1 = n
  	move	$a0, $t1
  	jal	prime
  	beq	$v1, $zero, LLL
  	
  	move	$a0, $t1		
	li $v0, 1					
	syscall
	
	li      $v0, 4				
	la      $a0, msg2			
	syscall
	
	li $v0, 10
	syscall
	
	LLL:
	move	$a0, $t1		
	li $v0, 1					
	syscall
	
	li      $v0, 4				
	la      $a0, msg3		
	syscall
	
	addi	$t4, $zero, 1	# t4 = i
	Loop2:
		bne	$t5, $zero, L2
		move	$a0, $t1
		sub	$a0, $a0, $t4
		jal	prime
		beq	$v1, $zero, LLLL
		li	$v0, 1					
		syscall
		li      $v0, 4				
		la      $a0, msg4		
		syscall
		addi	$t5, $zero, 1
		LLLL:
		move	$a0, $t1
		add	$a0, $a0, $t4
		jal	prime
		beq	$v1, $zero, LLLLL
		li	$v0, 1					
		syscall
		li      $v0, 4				
		la      $a0, msg4		
		syscall
		addi	$t5, $zero, 1
		LLLLL:
		addi	$t4, $t4, 1
		j	Loop2
	L2:
	li $v0, 10
	syscall

	
.text
prime:	
	addi	$s0, $a0, -1			
	bne	$s0, $zero, L
	move	$v1, $zero
	jr	$ra
L:	addi	$t0, $zero, 2	# t0 = i
	Loop1:
		mul	$t2, $t0, $t0	# t2 = i * i
		bgt	$t2, $a0, L1
		div	$t3, $a0, $t0
		mfhi	$t3	# t3 = n % i
		bne	$t3, $zero, LL
		move	$v1, $zero
		jr	$ra
		LL:
		addi	$t0, $t0, 1
		j	Loop1
	L1:
	addi	$v1, $zero, 1
	jr	$ra	
