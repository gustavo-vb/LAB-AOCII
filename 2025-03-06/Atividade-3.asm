.data
mensagem1: .asciiz "Digite um numero inteiro positivo: "
mensagem2: .asciiz "Pressione 'd' para contar positivo, ou 'e' para contar negativo: "
mensagem3: .asciiz "\n Contando... \n"
pula_linha: .asciiz "\n"
opcao1: .asciiz "d"
opcao2: .asciiz "e"

.text

.globl main

main:

la $s0, opcao1
la $s1, opcao2
#-----------------

li $v0, 4
la $a0, mensagem1
syscall

li $v0, 5
syscall

move $t0, $v0
#------------------

li $v0, 4
la $a0, mensagem2
syscall

li $v0, 12
syscall

move $t1, $v0
#------------------

beq $t1, $s0, crescente
beq $t1, $s1, decrescente
#------------------

crescente:
li $v0, 4
la $a0, mensagem3
syscall

addi $s3, $t0, 1

jal imprime
imprime:
beq $s2, $s3, exit

li $v0, 1
la $a0, ($s2)
syscall

li $v0, 4
la $a0, pula_linha
syscall

addi $s2, $s2, 1
jr $ra
#--------------------

decrescente:
li $v0, 4
la $a0, mensagem3
syscall

sub $s3, $s3, $t0

jal imprime2
imprime2:
beq $s2, $s3, exit

li $v0, 1
la $a0, ($s2)
syscall

li $v0, 4
la $a0, pula_linha
syscall

sub $s2, $s2, 1
jr $ra
#-------------------


exit:
li $v0, 10
syscall