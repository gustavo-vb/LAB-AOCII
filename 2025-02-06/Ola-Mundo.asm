.data
mensagem1: .asciiz "Digite um número:"

.text 
.globl main

main:

li $v0, 4
la $a0, mensagem1
syscall

li $v0, 5
syscall

move $t0, $v0
