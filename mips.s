#n = 36, so use base 36 I think
#M = 26, so delta is 26th uppercase and fancy B is 26th lowercase, aka A-Z and a-z
#10-35 are A-Z, 36+ are 9+(x-35) (From letter or number-> base 36)
#Need to: Go over each character, check if it's a "/", if not, check if its within valid range

.data
buffer: .space 1000 #storage
prompt: .asciiz "Enter: "
slash: .asciiz "/"
space: .asciiz " "
nosuch: .asciiz "-"

.text
.globl main
main:
li $v0, 4 
la $a0, prompt #Printing prompt
syscall 
li $v0, 8 #Reads from the string
la $a0, buffer #Input will be stored in buffer, $a0 is basically pointing to buffer, will be used in process_whole_string 
li $a1, 1000 #Making it so the max amount of characters that can be read is 1000
syscall
jal process_whole_string
li $v0, 10
syscall

process_whole_string:



looping:

validchar:
li $t0, 65 #ASCII for A
li $t1, 90 #ASCII for Z
li $t2, 97 #ASCII for a
li $t3, 122 #ASCII for z
li $t4, 47 #ASCII for /

looping_whole:


process_substring:
move $s0, a0 #Putting input into $s0
li $s1, 0 #Index holder
li $s2, 0 #Movement holder

looping_sub:

add_number:

