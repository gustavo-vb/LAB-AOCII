.data
vetor: .space 40
mensagem1: .asciiz "Digite dez valores, de 33 a 126 alternando com ENTER:\n"
mensagem2: .asciiz "Transformando os valores que voce digitou em simbulos ascii...\n"
mensagem3: .asciiz "\nNumeros convertidos."

.text

.globl main
main:
la $t0, vetor
li $s0, 0 #controle loop

li $v0, 4
la $a0, mensagem1
syscall

Loop:
beq $s0, 10, Continua

li $v0, 5
syscall
sw $v0, 0($t0)

addiu $t0, $t0, 4
addi $s0, $s0, 1
j Loop

Continua:
li $v0, 4
la $a0, mensagem2
syscall

la $t0, vetor
li $s0, 0 #controle loop

Converte_Loop:
beq $s0, 10, SAI

lw $a0, 0($t0)
li $v0, 11
syscall

addiu $t0, $t0, 4
addi $s0, $s0, 1
j Converte_Loop

SAI:
li $v0, 4
la $a0, mensagem3
syscall

li $v0, 10
syscall

