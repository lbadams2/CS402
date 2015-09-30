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
main:	addu $16, $31, $0        #addu $s0, $ra, $0# save $31 in $16 
		lui $8, 4097             #load x1001 into upper 16 bits of $1
		lw $15, 0($1)             #load contents of $1 into $0 with offset of 0
		lui $8, 4097             #load x1001 into upper 16 bits of $1 
		lw $9, 12($1)            #load contents of $1 into $9 with offset of 12
		lui $8, 4097             #load x1001 into upper 16 bits of $1 
		sw $9, 0($1)             #store contents of $1 with offset 0 into $9
		lui $8, 4097             #load x1001 into upper 16 bits of $1 
		sw $15, 12($1)            #store contents of $1 with offset 12 into $0
		lui $8, 4097             #load x1001 into upper 16 bits of $1 
		lw $10, 4($1)            #load contents of $1 into $10 with offset of 4
		lui $8, 4097             #load x1001 into upper 16 bits of $1 
		lw $11, 8($1)            #load contents of $1 into $11 with offset of 8
		lui $8, 4097             #load x1001 into upper 16 bits of $1 
		sw $11, 4($1)            #store contents of $1 with offset 4 into $11
		lui $8, 4097             #load x1001 into upper 16 bits of $1 
		sw $10, 8($1)            #store contents of $1 with offset 8 into $10
		ori $2, $0, 1            #or contents of $0 with 1 and store in $2, which is v0 the register that stores syscall instructions
		lui $8, 4097             #load x1001 into upper 16 bits of $1 
		lw $4, 0($1)             #load contents of $1 into $4 with offset of 0, $4 is a0 the register that stores the address of the label to be printed
		syscall                  #syscall #call print_int - should be 268435457 base 10 
		ori $2, $0, 4            #or contents of $0 with 4 and store in $2, which is v0 the register that stores syscall instructions
		lui $8, 4097 			 #load x1001 into upper 16 bits of $1 
		ori $4, $1, 18 			 #or contents of $1 with x12 and place in a0
		syscall                  #syscall # call print str 
		ori $2, $0, 1            
		lui $8, 4097             
		lw $4, 4($1)             
		syscall                  
		ori $2, $0, 4            
		lui $8, 4097    
		ori $4, $1, 18 
		syscall                  
		ori $2, $0, 1            
		lui $8, 4097             
		lw $4, 8($1)             
		syscall                  
		ori $2, $0, 4            
		lui $8, 4097    
		ori $4, $1, 18  
		syscall                  
		ori $2, $0, 1            
		lui $8, 4097             
		lw $4, 12($1)            
		syscall                  
		addu $31, $0, $16        
		jr $31