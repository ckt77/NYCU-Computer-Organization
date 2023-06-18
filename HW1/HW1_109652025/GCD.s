.data
msg1:	.asciiz "Enter first number: "
msg2:	.asciiz "Enter second number: "
msg3:	.asciiz	"The GCD is: "

.text
.globl main
main:
	li      $v0, 4				
	la      $a0, msg1			
	syscall
	
	li      $v0, 5          	
  	syscall                 	
  	move    $a1, $v0
  	
  	li      $v0, 4				
	la      $a0, msg2		
	syscall
	
	li      $v0, 5          	
  	syscall                 	
  	move    $a2, $v0
  	
  	jal	gcd
  	move	$t0, $v0 
  	 
  	li      $v0, 4				
	la      $a0, msg3			
	syscall
	
	move	$a0, $t0  
	li $v0, 1					
	syscall
	
	li $v0, 10					
  	syscall		
  	
 .text
gcd:	addi	$sp, $sp, -12		
	sw	$ra, 8($sp)				
	sw	$a1, 4($sp)
	sw	$a2, 0($sp)
	div	$t0, $a1, $a2
	mfhi	$t1	
	bne	$t1, $zero, L
	add	$v0, $zero, $a2
	addi	$sp, $sp, 12
	jr	$ra
	
L:	move	$a1, $a2
	move	$a2, $t1
	jal	gcd
	lw	$a2, 0($sp)				
	lw	$a1, 4($sp)
	lw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jr $ra	
  	
	
	
	
