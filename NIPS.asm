	.data
		Problem1:	.word	0x40A80000
		Problem2:	.word	0x3EA00000
		MantissaMask:	.word	0x007FFFFF
		FrontMask:	.word	0xFF800000
		space: 		.asciiz "\n"
	.text
	.globl main
main:
	lw	$t0,Problem1($zero)
	lw	$t2,MantissaMask($zero)
	lw	$t3,FrontMask($zero)
	addi	$t1,$t1,2		# Variable to repeat for Problem2

loop:	# Convert mantissa
	and	$t4,$t0,$t2		# Pull mantissa
	srl	$t4,$t4,1		# Shift mantissa once to make room to unhide front bit
	addi 	$t4,$t4,4194304		# Addi 2^22 to unhide front bit

	# Convert exponent
	addi 	$t0, $t0, 16777216	# Add 2 to exponent value by addi 2^24
	
	# Merge new mantissa
	and	$t0,$t0,$t3		# Zeroize mantissa
	add	$t0,$t0,$t4		# Add updated mantissa
	
	# Print integer
	li	$v0, 34			# Print hex value
    	move	$a0, $t0
	syscall
	
	# Newline
	addi $v0, $zero, 4  		# print_string syscall
	la $a0, space       		# load address of the string
	syscall

	lw	$t0,Problem2($zero)
	addi	$t1,$t1,-1
	bne	$t1,$zero,loop
        
    	# Exit
	li       $v0, 10		# call = 10 = exit
	syscall				# done.
