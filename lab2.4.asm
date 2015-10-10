.data 0x10010000
var1: .word 0x0016
var2: .word 0x004d
newline: .asciiz "\n"
.extern ext1 4
.extern ext2 5

		.text
		.globl main
main:	addu $s0, $ra, $0# save $31 in $16
		
		lw $t0, var1  #load word stored in var1 to t0
		lw $t1, ext2  #load word stored in ext2 to t1
		sw $t1, var1  #store word stored in t1 to var1
		sw $t0, ext2  #store word stored in t0 to ext2
		
		lw $t2, var2  #load word stored in var2 to t2
		lw $t3, ext1  #load word stored in ext1 to t3
		sw $t3, var2  #store word stored in t3 to var2
		sw $t2, ext1  #store word stored in t2 to ext1
		
		li $v0, 1  #system call for print_int
		lw $a0, var1 # load word in var1 to register used by print_int
		syscall  #call print_int
		
		li $v0, 4 # system call for print_str
		la $a0, newline # load newline character into register used by print_str
		syscall # call print str
		
		li $v0, 1 # system call for print_int
		lw $a0, var2 # load word in var2 to register used by print_int
		syscall # call print_int
		
# restore now the return address in $ra and return from main
		addu $ra, $0, $s0 # return address back in $31
		jr $ra # return from main