.data
vetor: .word 12, 5, 8, 34, 2, 17, 99, 1, 25, 43, 6, 78, 0, 13, 21
tam: .word 15
mensagem: .asciiz "Maior valor: "
pula_linha: .asciiz "\n"

.text
.globl main

main:
la $t0, vetor
lw $t1, tam
lw $t2, 0($t0)
li $t3, 1

loop:
bge $t3, $t1, fim
sll $t4, $t3, 2
addu $t4, $t0, $t4
lw $t5, 0($t4)
    
ble $t5, $t2, pula
move $t2, $t5
    
pula:
addiu $t3, $t3, 1
j loop

fim:
li $v0, 4
la $a0, mensagem
syscall

li $v0, 1
move $a0, $t2
syscall

li $v0, 4
la $a0, pula_linha
syscall

li $v0, 10
syscall