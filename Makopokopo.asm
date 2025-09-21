# #include <iostream>
# using namespace std;
#
# int main() {
#     int litres;
#     cout << "Enter quantity of grains in litres\n";
#     cin >> litres;
#
#     if (litres < 0) {
#         cout << "Error! We cannot have a quantity of less than zero\n";
#         return 0;
#     }
#
#     int makopokopo = litres / 20;   // quotient
#     int remainder  = litres % 20;   // remainder
#
#     cout << "Number of makopokopo(20L) is: " << makopokopo;
#     cout << "\nRemaining litres: " << remainder;
#
#     return 0;
# }
.data
	prompt: .asciz "Enter quantity of grains in litres\n"
	print_error: .asciz "Error! We cannot have a quantity of less than zero\n"
	makopokopo_result: .asciz "Number of makopokopo(20L) is: \n"
	result_remainder: .asciz "\nRemaining litres: \n"
	
.text
.globl main
main:
	#prompt user for the quantity of grains in litres
	la a0, prompt
	li a7, 4
	ecall
	
	#Read integer input
	li a7, 5
	ecall
	mv t0, a0 #store input in t0
	
	#if n < 0, print error and exit
	blt t0, x0, error_handler
	
	#initialize variables
	li t1, 20
	li t2, 0 # counter for makopokopo, the quotient
	mv t3, t0 # remaining litres
	
	#handle case where input is less than 20
	blt t3, t1, print_result
	
loop: 
	#If remaining litres < 20, we are done
	blt t3, t1, print_result
	
	#Subtract 20 from remaining litres
	sub t3, t3, t1 # remaining -= 20
	
	#Increment makopokopo counter
	addi t2, t2, 1 #count++
	
	j loop

print_result:
	#display number of makopokopo
	la a0, makopokopo_result
	li a7, 4
	ecall
	
	mv a0, t2 #print makopokopo count
	li a7, 1
	ecall
	
	#print remaining litres
	la a0, result_remainder
	li a7, 4
	ecall
	
	mv a0, t3 #print remainder
	li a7, 1
	ecall
	
	j exit
error_handler:
	la a0, print_error
	li a7, 4
	ecall
exit:
	li a7, 10
	ecall
	
	
