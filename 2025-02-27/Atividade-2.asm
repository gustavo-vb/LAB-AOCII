#Feito por GUSTAVO VILAS BOAS PEREIRA

.data
mensagem1: .asciiz "Digite um numero: "
mensagem2: .asciiz "Verificando se o numero e par ou impar... \n"
conf1: .asciiz "O numero "
conf2: .asciiz " e par."
conf3: .asciiz " e impar."
.text

.globl main

main:
li $t2, 2
li $v0, 4
la $a0, mensagem1
syscall

li $v0, 5
syscall
move $t0, $v0
#---------------

li $v0, 4
la $a0, mensagem2
syscall
#---------------


div $t0, $t2
mfhi $t1

beq $t1, 0, par
bne $t1, 0, impar
#---------------

par:
li $v0, 4
la $a0, conf1
syscall

li $v0, 1
la $a0, ($t0)
syscall

li $v0, 4
la $a0, conf2
syscall

li $v0, 10
syscall

impar:
li $v0, 4
la $a0, conf1
syscall

li $v0, 1
la $a0, ($t0)
syscall

li $v0, 4
la $a0, conf3
syscall

li $v0, 10
syscall
#------------------


