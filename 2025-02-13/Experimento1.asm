.data
mensagem1: .asciiz "Digite um número: "
mensagem2: .asciiz "Digite um segundo número: "
mensagem3: .asciiz "O resultado da soma é: "

.text 
.globl main

main:

li $v0, 4
la $a0, mensagem1
syscall

li $v0, 5
syscall

move $t0, $v0

li $v0, 4
la $a0, mensagem2
syscall

li $v0, 5
syscall

move $t1, $v0

add $t2, $t0, $t1

li $v0, 4
la $a0, mensagem3
syscall

li $v0, 1
la $a0, ($t2)
syscall
