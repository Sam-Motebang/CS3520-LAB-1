# #include <iostream>
# using namespace std;
#
# int main() {
#     int day;
#     cout << "Enter a number 1-7 that represents part of the week\n";
#     cin >> day;
#
#     if (day < 1 || day > 7) {
#         cout << "Error! Invalid day\n";
#         return 0;
#     }
#
#     switch(day) {
#         case 1: 
#				cout << "Mantaha\n"; break;
#         case 2: 
#				cout << "Labobeli\n"; 
#				break;
#         case 3: 
#				cout << "Laboraro\n"; 
#				break;
#         case 4: 
#				cout << "Labone\n"; 
#				break;
#         case 5: 
#				cout << "Labohlano\n"; 
#				break;
#         case 6: 
#				cout << "Moqebelo\n"; 
#				break;
#         case 7: 
#				cout << "Sontaha\n"; 
#				break;
#     }
#     return 0;
# }
.data
	prompt: .asciz "Enter a number 1-7 that reprents part of the week\n"
	error: .asciz "Error! Invalid day\n"
	monday: .asciz "Mantaha\n"
	tuesday: .asciz "Labobeli\n"
	wednesday: .asciz "Laboraro\n"
	thursday: .asciz "Labone\n"
	friday: .asciz "Labohlano\n"
	saturday: .asciz "Moqebelo\n"
	sunday: .asciz "Sontaha\n"
.text
.globl main
main:
	#Prompt user for input
	la a0, prompt
	li a7, 4
	ecall
	
	#Read input from user
	li a7, 5
	ecall
	mv t0, a0 #store input in t0
	
	#initialize day 1-7
	li t1, 1 # minimum value
	li t2, 7 # maximum value
	
	#Print error message if input <= 0 or input > 7
	blt t0, t1, print_error
	bgt t0, t2, print_error
	
	#monday = 1
	li t1, 1
	beq t0, t1, print_monday
	
	#tuesday = 2
	li t1, 2
	beq t0, t1, print_tuesday
	
	#wednesday = 3
	li t1, 3
	beq t0, t1, print_wednesday
	
	#thursday = 4
	li t1, 4
	beq t0, t1, print_thursday
	
	#friday = 5
	li t1, 5
	beq t0, t1, print_friday
	
	#saturday = 6
	li t1, 6
	beq t0, t1, print_saturday
	
	#sunday = 7
	li t1, 7
	beq t0, t1, print_sunday
	
print_error:
	la a0, error
	li a7, 4
	ecall
	
	j exit
	
print_monday:
	la a0, monday
	li a7, 4
	ecall
	
	j exit
	
print_tuesday:
	la a0, tuesday
	li a7, 4
	ecall
	
	j exit
	
print_wednesday:
	la a0, wednesday
	li a7, 4
	ecall
	
	j exit
	
print_thursday:
	la a0, thursday
	li a7, 4
	ecall
	
	j exit
	
print_friday:
	la a0, friday
	li a7, 4
	ecall
	
	j exit
	
print_saturday:
	la a0, saturday
	li a7, 4
	ecall
	
	j exit
	
print_sunday:
	la a0, sunday
	li a7, 4
	ecall
	
	j exit
	
exit:
	li a7, 10
	ecall
