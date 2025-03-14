.data
mensagem1: .asciiz "Digite um valor inteiro para a posição [0] do vetor: "
mensagem2: .asciiz "Digite um valor inteiro para a posição [1] do vetor: "
mensagem3: .asciiz "Digite um valor inteiro para a posição [2] do vetor: "
mensagem4: .asciiz "Digite um valor inteiro para a posição [3] do vetor: "
exibir: .asciiz "Exibindo os números no vetor... \n"
quebra_linha: .asciiz "\n"
vetor: .space 16

.text

.globl main

main:
la $t0, vetor
#-----------------

li $v0, 4
la $a0, mensagem1
syscall

li $v0, 5
syscall

sw $v0, 0($t0)
#--
li $v0, 4
la $a0, mensagem2
syscall

li $v0, 5
syscall

sw $v0, 4($t0)
#--
li $v0, 4
la $a0, mensagem3
syscall

li $v0, 5
syscall

sw $v0, 8($t0)
#--
li $v0, 4
la $a0, mensagem4
syscall

li $v0, 5
syscall

sw $v0, 12($t0)
#-----------------

li $v0, 4
la $a0, exibir
syscall

li $v0, 1
lw $a0, 0($t0)
syscall

li $v0, 4
la $a0, quebra_linha
syscall
#--
li $v0, 1
lw $a0, 4($t0)
syscall

li $v0, 4
la $a0, quebra_linha
syscall
#--
li $v0, 1
lw $a0, 8($t0)
syscall

li $v0, 4
la $a0, quebra_linha
syscall
#--
li $v0, 1
lw $a0, 12($t0)
syscall

li $v0, 4
la $a0, quebra_linha
syscall
#--------------------
