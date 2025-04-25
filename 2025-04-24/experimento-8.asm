.data
    enunciado: .asciiz "Frase original: "
    programa: .asciiz "\nConvertendo para caixa grande...\n"
    frase: .asciiz "hoje eh um dia belo de chuva e neblina"
    

.text

.globl main

main:
    la $t0, frase
    
    li $v0, 4
    la $a0, enunciado
    syscall
    
    li $v0, 4
    la $a0, frase
    syscall
    
    li $v0, 4
    la $a0, programa
    syscall

loop:
    lb $t1, 0($t0)
    beq $t1, $zero, fim
    
    li $t2, 'a'
    blt $t1, $t2, prox_char
    li $t2, 'z'
    bgt $t1, $t2, prox_char
    
    addi $t1, $t1, -32
    sb $t1, 0($t0)
    
prox_char:
    addi $t0, $t0, 1
    j loop

fim:
    li $v0, 4
    la $a0, frase
    syscall
    
    li $v0, 10
    syscall