
	.data
break:	.asciiz	"\n"

ask: 	.asciiz "Please enter a random 4 digit number for a seed: "

input:	.float	4

list :	.word 100


multIt:		.float 32749
addIt:		.float	32649
divIt:		.float	32768
oneHundred:	.float	100


	.text
la 	$t5, list			#$t5 array address for first loop
la 	$t7, list			#$t7 array adress for second loop

l.s	$f9, multIt			#$f9 has float to multiply 32749
l.s	$f8, addIt			#$f8 has float to add 32649
l.s	$f7, divIt			#$f7 has number to divide 32768
l.s	$f5 oneHundred			#$f5 has constant 100 to divide by to move decimal

li	$t3, 20 			#$t3 has loop count comparison for BNE
li	$t2, 0  			#$t2 has zero for loop count to be incrememnted for BNE comparison in loop 1
li 	$t9, 0				#$t9 has zero for loop count to be incrememnted for BNE comparison in loop 2

randnum:				#randnum() function
beq 	$t2, $t3, printLoop		#If loop counter == 20, branch to print loop, printLoop function
la 	$a0, ask			#Load the address of string to print asking for input
li 	$v0, 4				#Load syscall to print ask string
syscall					#syscall to print ask string

la 	$a0, input			#Gets user input into float varible
la 	$a1, input			#Gets user input size of float variable
li 	$v0, 6				#Syscall code to load user float input
syscall

mov.s 	$f10, $f0			#Moves input from $f0 to $f10 for math

mul.s	$f6, $f10, $f9			#Multiplies seed (input) * 3279 and stores in $f6
add.s	$f6, $f6, $f8			#Adds above + 32649
div.s	$f6, $f6, $f7			#Divide above / 32768
div.s	$f12, $f6, $f5			#Divide above / 100 to move decimal, store in $f12

addi 	$t2, $t2, 1			#Add 1 to loop counter in $t2 for BNE comparison

s.s 	$f12, ($t5)			#Put above math result in float array address in $t5
addi 	$t5, $t5, 4			#Increment array address position by 4 in $t5

la	$a0, break			#Print line break string for input
li	$v0, 4				#Syscall code to print string
syscall
	
j randnum				#Starts from beginning of loop


printLoop:				#printLoop() Function to print loop after filling it

beq 	$t3, $t9, exit			#Exit program if loop counter == 20

l.s 	$f12, ($t7)			#Load float from array address in $t7
addi 	$t7, $t7, 4			#Add 4 to $t7 array address to update for next array
addi 	$t9, $t9, 1			#Add 1 to loop counter variable

li 	$v0, 2				#Syscall to print floating point loaded from array
syscall

la 	$a0, break			#Print line break
li 	$v0, 4				#Syscall code to print line break
syscall
		
j printLoop				#Loop to top of printLoop() function

exit:
li	$v0, 10				#Syscall code to exit
syscall					#Exits

