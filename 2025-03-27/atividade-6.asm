.data
mensagem1: .asciiz "Digite um valor inteiro: " #mensagem em string
mensagem2: .asciiz "Calculando fatorial do numero digitado... \n"  #mensagem em string
mensagem3: .asciiz "Resultado: "

.text   # segmento de código (programa)

j main

fact:
    sub $sp, $sp, 8    #reserva 8 bytes na pilha  
    sw $ra, 4($sp)     #salva o registrador de retorno $ra
    sw $a0, 0($sp)     #salva o argumento
    slti $t0, $a0, 1   #ve se o valor do número $a0 e menor que 1
    beq $t0, $zero, L1 #se nao for menor que 1, pula para o rotulo L1.
    add $v0, $zero, 1  #retorna 1
    add $sp, $sp, 8     #restaura pilha  
    jr $ra          #volta para a linha seguinte do jal      

L1: 
    sub $a0, $a0, 1      #caso contrario, decrementa $a0 em 1.
    jal fact              #chama fact 
    lw $a0, 0($sp)       #carrega para $a0 o que esta no comeco da pilha 
    lw $ra, 4($sp)        #carrega para o $ra o que esta 4 bytes do inicio da pilha
    add $sp, $sp, 8       #restaura pilha
    mul $v0, $a0, $v0   #multiplica o valor atual de $a0 pelo resultado retornado
    jr $ra      #volta para a linha seguinte do jal          

main:
    li $s0, 0 #carrega valor 0
    li $s1, 0 #carrega valor 0
    
    li $v0, 4 #carrega valor 4 para imprimir string
    la $a0, mensagem1 #carrega endereco da mensagem 1
    syscall #chama a syscall e exibe na tela a mensagem
    
    li $v0, 5 #carrega valor 5 para ler int
    syscall #chama a syscall para ler inteiro
    
    move $s0, $v0 #move para $s0 o que esta em $v0
    
    li $v0, 4 #carrega valor 4 para imprimir string
    la $a0, mensagem2 #carrega endereco da mensagem 2
    syscall #chama a syscall e exibe na tela a mensagem
    
    add $a0, $zero, $s0 #adiciona em $a0 o valor do reg. $zero e o valor do reg. $s0
    jal fact #faz um pulo para o rotulo fact e guarda o endereco da linha para voltar
    
    li $v0, 4 #carrega valor 4 para imprimir string
    la $a0, mensagem3 #carrega endereco da mensagem 3
    syscall #chama a syscall e exibe na tela a mensagem
    
    mflo $s1 #carrega o valor que esta em lo
    
    li $v0, 1 #carrega o valor 1 para imprimir inteiro
    move $a0, $s1 #move o que esta em $s1 para $a0
    syscall #chama a syscall para imprimir inteiro que esta em $a0