.data
mensagem1: .asciiz "Digite um numero: "
mensagem2: .asciiz "Digite outro numero: "
mensagem3: .asciiz "Qual operacao voce quer realizar? (1 - Soma  2- Subtracao): "
mensagem4: .asciiz "O resultado da operacao e:"
mensagem_conf: .asciiz "Valores digitados: \n"
pula_linha: .asciiz "\n"

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

li $v0, 4
la $a0, mensagem2
syscall

li $v0, 5
syscall

move $t1, $v0

li $v0, 4
la $a0, mensagem_conf
syscall

li $v0, 1
la $a0, ($t0)
syscall

li $v0, 4
la $a0, pula_linha
syscall

li $v0, 1
la $a0, ($t1)
syscall

li $v0, 4
la $a0, pula_linha
syscall

li $v0, 4
la $a0, mensagem3
syscall

li $v0, 5
syscall

move $t2, $v0

beq $t2, 1, soma
beq $t2, 2, subtrai


soma:
add $t3, $t0, $t1

li $v0, 4
la $a0, mensagem4
syscall

li $v0, 1
la $a0, ($t3)
syscall
li $v0, 10
syscall


subtrai:
sub $t3, $t0, $t1

li $v0, 4
la $a0, mensagem4
syscall

li $v0, 1
la $a0, ($t3)
syscall

li $v0, 10
syscall
