# #include <iostream>
# using namespace std;
# int main() {
#     int n;
#     cout << "Enter height of pyramid: ";
#     cin >> n;
#
#     for (int i = 0; i < n; i++) {
#         for (int j = 0; j < n - i - 1; j++)
#             cout << " ";
#         for (int k = 0; k < 2*i + 1; k++)
#             cout << "*";
#         cout << "\n";
#     }
#     return 0;
# }
.data
	prompt: .asciz "Enter the height you want your mokorotlo to be\n"
	newline: .asciz "\n"
	space: .asciz " "
	star: .asciz"*"
.text
.globl main
main:
	#prompt user for the height
	la a0, prompt
	li a7, 4
	ecall
	
	#read integer input
	li a7, 5
	ecall
	mv t0, a0 # n = input
	li t1, 0 # i = 0
	
row_loop:
	bge t1, t0, exit #if i>=n, exit
	
	#print spaces: n - i - 1
	sub t2, t0, t1
	addi t2, t2, -1
	li t3, 0
	
space_loop:
	bge t3, t2, star_loop
	la, a0, space
	li a7, 4
	ecall
	
	addi t3, t3, 1
	j space_loop
	
star_loop:
	slli t4, t1, 1
	addi t4, t4, 1
	li t5, 0
	
print_star:
	bge t5, t4, print_newline
	la a0, star
	li a7, 4
	ecall
	
	addi t5, t5, 1
	j print_star
	
print_newline:
	la a0, newline
	li a7, 4
	ecall
	
	addi t1, t1 1 #i++
	j row_loop
	
exit:
	li a7, 10
	ecall