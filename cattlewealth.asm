# Mahali classification
.data
	prompt: .asciz "U tlo lefa mahali a khomo tse kae?\n"
	error: .asciz "Error! Cannot in any many pay less than zero cattle\n"
	print_rich: .asciz "Wealthy cattle owner\n" #print if var > 30
	print_poor: .asciz "Not enough for bohali\n" #print if var > 15
	print_middle: .asciz "Small herd\n" #print if var <= 15
.text
.globl main
main:
	#Prompt user for the amount of cattle they will be delivering for Mahali
	la a0, prompt
	li a7, 4
	ecall
	
	#Read input
	li a7, 5
	ecall
	mv t0, a0 #store input in t0
	
	#Print error message for cattle < 0
	blt t0, x0, print_error
	
	#initialize variables
	li t1, 30 # a rich cattle owner should output cattle > 30
	li t2, 15 # small herd > 15 and not enough cattle < 15
	
	#if cattle <= 15
	ble t0, t2, display_poor
	
	#if cattle > 30
	bgt t0, t1, display_rich
	
	#if cattle > 15
	bgt t0, t2, display_mid
	
	
print_error:
	la a0, error
	li a7, 4
	ecall
	
	
	j exit

display_mid:
	la a0, print_middle
	li a7, 4
	ecall
	
	j exit
	
display_poor:
	la a0, print_poor
	li a7, 4
	ecall
	
	j exit
	
display_rich:
	la a0, print_rich
	li a7, 4
	ecall
	
	j exit
	
exit:
	li a7, 10
	ecall
	
	
	
