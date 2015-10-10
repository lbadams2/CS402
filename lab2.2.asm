.data 0x10010000 
var1: .word 0x0000
var2: .word 0x0001
var3: .word 0xabcd
var4: .word 0x10000001
first: .byte 'l'   # use a letter from your own name
last: .byte 'a'   # use a letter from your own name
newline: .asciiz "\n"

		.text
		.globl main
main:	addu $s0, $ra, $0# save $31 in $16
		
		lw $t0, var1  #load word stored in var1 to t0
		lw $t1, var4  #load word stored in var4 to t1
		sw $t1, var1  #store word stored in t1 to var1
		sw $t0, var4  #store word stored in t0 to var4
		
		lw $t2, var2 # load word stored in var2 to t2
		lw $t3, var3 # load word stored in var3 to t3
		sw $t3, var2 # store word stored in t3 to var2
		sw $t2, var3 # store word stored in t2 to var3
		
		li $v0, 1  #system call for print_int
		lw $a0, var1 # load word in var1 to register used by print_int
		syscall  #call print_int - should be 268435457 base 10
		
		li $v0, 4 # system call for print_str
		la $a0, newline # load newline character into register used by print_str
		syscall # call print str
		
		li $v0, 1 # system call for print_int
		lw $a0, var2 # load word in var2 to register used by print_int
		syscall # call print_int - should be 43981 base 10
		
		li $v0, 4 # system call for print_str
		la $a0, newline # load newline character into register used by print_str
		syscall # call print str
		
		li $v0, 1 # system call for print_int
		lw $a0, var3 # load word in var3 to register used by print_int
		syscall # call print_int - should be 1 base 10
		
		li $v0, 4 # system call for print_str
		la $a0, newline # load newline character into register used by print_str
		syscall # call print str
		
		li $v0, 1 # system call for print_int
		lw $a0, var4 # load word in var4 to register used by print_int
		syscall # call print_int - should be 0 base 10
		
# restore now the return address in $ra and return from main
		addu $ra, $0, $s0 # return address back in $31
		jr $ra # return from main