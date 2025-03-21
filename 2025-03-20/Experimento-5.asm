.data
var_global: .word 0
mensagem_result: .asciiz "O resultado é: \n"

.text

.globl main

main:
la $t0, var_global
#-----------------

li $s1, 10
sll $s2, $s1, 8

add $t1, $s1, $s2

sw $t1, 0($t0)
#-----------------

li $v0, 4
la $a0, mensagem_result
syscall

li $v0, 1
lw $a0, 0($t0)
syscall