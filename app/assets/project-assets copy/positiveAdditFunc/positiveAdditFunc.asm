.data

inputA: .word 4	#Where we temporarily put inputA

inputB: .word 4#Where we temporarily put inputB

askA : .asciiz "Please enter letter A: " #String to ask for letter A

askB : .asciiz "Please enter letter B: " #String to ask for letter B

positiveNumber : .asciiz " - The number was positive" #String to tell user it was a positive number
negativeNumber : .asciiz " - The Number was negative" #String to tell user it was a negative number

.text 

main:

la $a0, askA	#Load address of askA from memory and store it reg 0
li $v0, 4	#Loads value 4 into opCode register
syscall		#Asks user to input A

la $a0, inputA	#sets $a0 to point to space allocated for word
la $a1, inputA	#gets space length so wont exceed memory limit
li $v0, 5	#loads opCode 5 for getting string from user into $v0
syscall		#Gets user input as an integer (syscall 5)
move $t0, $v0	#Puts inputA into memory $t0


la $a0, askB	#Load address of askB from memory and store it reg 0
li $v0, 4	#Loads value 4 into opCode register
syscall		#Asks user for input B

la $a0, inputB	#sets $a0 to point to space allocated for word inputB
la $a1, inputB	#gets space length so wont exceed memory limit
li $v0, 5	#loads opCode for getting string from user into $v0
syscall		#Gets string from user into $v0 for input B
move $t1, $v0	#Moves user input for B into $t1


j addit		#Reffers to addit() function

positive:				#negative() function
	la $t4, 1			#Load 1 into $t4 for branch comparison
	slt $s3, $zero, $s2		#If $s2 > 0 then set $s3 to 1 or else set to 0
	bne $s3, $t4, negative 	#Branch to answerOne if addit() > 0, compares $s3 (result of slt) and $t4 (we set to 1)

	#Continue if number is <0


	la $a0, 1			#load 1 into $a0 to return 1		
	li $v0, 1			#Syscall to print integer 0 (return 0)
	syscall
	la $a0, positiveNumber		#Load address of positiveNumber from memory and store it reg 0
	li $v0, 4			#Loads value 4 into opCode register
	syscall				#Prings that number is positive
	li $v0, 10			#Syscall to exit program
	syscall

negative:				#Jumps here if number is < 0
	la $a0, 0			#Load 0 to Return 0 if negative
	li $v0, 1			#Syscall for Print integer in $a0
	syscall
	la $a0, negativeNumber		#Load address of negativeNumber from memory and store it reg 0
	li $v0, 4			#Loads value 4 into opCode register
	syscall				#Prings that number is negative
	li $v0, 10			#Syscall to Exit
	syscall

					
addit:					#Addit() function
	add $s2, $t0, $t1		#Adds Our input A and Input B
	j positive			#Goes to our negative() function	






